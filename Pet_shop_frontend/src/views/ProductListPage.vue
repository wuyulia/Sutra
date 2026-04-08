<!-- 商品展示页 -->
<template>
  <div class="product-list-page">
    <!-- 1. 面包屑/搜索提示 (体现通用性) -->
    <div class="breadcrumb">
      <span>全部商品</span>
      <span v-if="currentKeyword" class="keyword"> > "{{ currentKeyword }}"</span>
    </div>

    <!-- 2. 筛选工具栏 (模仿京东) -->
    <div class="filter-toolbar">
      <!-- 品牌筛选 (这里先写死几个占位，后续可从后端动态获取) -->
      <div class="filter-row">
        <div class="filter-label">品牌：</div>
        <div class="filter-options">
          <span class="option">皇家 (Royal Canin)</span>
          <span class="option">渴望 (Orijen)</span>
          <span class="option">伯纳天纯 (Pure&Natural)</span>
          <span class="option">冠能 (PRO PLAN)</span>
        </div>
      </div>
      
      <!-- 排序控制栏 -->
      <div class="sort-row">
        <div class="sort-group">
          <span :class="{ active: currentSort === 'default' }" @click="changeSort('default')">综合排序</span>
          <span :class="{ active: currentSort === 'sales' }" @click="changeSort('sales')">销量 ↓</span>
          <span :class="{ active: currentSort === 'price' }" @click="changeSort('price')">价格 ↕</span>
        </div>
        <div class="filter-checkboxes">
          <label><input type="checkbox" v-model="filters.stock"> 仅显示有货</label>
          <label><input type="checkbox" v-model="filters.isSelfOperated"> 京东自营</label>
        </div>
      </div>s
    </div>

    <!-- 3. 商品瀑布流网格 -->
    <div class="product-grid" v-if="!loading && productList.length > 0">
      <div 
        class="product-card" 
        v-for="item in productList" 
        :key="item.id"
        @click="goToDetail(item.id)"
      >
        <!-- 商品图片 -->
        <div class="img-wrapper">
          <!-- 这里应该用 v-lazy="item.coverImg" 实现懒加载，目前用 src 演示 -->
          <img :src="item.coverImg" :alt="item.name">
        </div>
        
        <!-- 价格区域 -->
        <div class="price-row">
          <span class="currency">¥</span>
          <span class="price">{{ item.price }}</span>
        </div>
        
        <!-- 商品标题 (最多显示两行，超出省略号) -->
        <div class="title-row">
          <span class="tag self-operated" v-if="item.isSelfOperated">自营</span>
          <span class="name">{{ item.name }}</span>
        </div>
        
        <!-- 评价与店铺 -->
        <div class="info-row">
           <span class="comments">{{ item.salesVolume || 0 }}人付款</span>
           <span class="shop">宠物之家自营店 ></span>
        </div>
        
        <!-- 底部操作区 (加入购物车按钮) -->
        <div class="action-row">
          <button class="add-to-cart" @click.stop="addToCart(item)">
            <i class="cart-icon">🛒</i> 加购物车
          </button>
        </div>
      </div>
    </div>

    <!-- 4. 加载状态与空状态 -->
    <div v-if="loading" class="loading-state">数据加载中...</div>
    <div v-if="!loading && productList.length === 0" class="empty-state">
      抱歉，没有找到相关商品~
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, watch, reactive } from 'vue'; // 增加 reactive
import { useRoute, useRouter } from 'vue-router'; // 增加 useRouter
import axios from 'axios';

const route = useRoute();
const router = useRouter(); // 用于跳转详情页

// --- 下面是缺失的变量，必须补上 ---
const productList = ref([]); 
const loading = ref(false);
const currentKeyword = ref(''); // 对应模板里的 currentKeyword
const currentSort = ref('default'); // 对应模板里的 currentSort
const filters = reactive({    // 对应模板里的 filters.stock 和 filters.isSelfOperated
  stock: false,
  isSelfOperated: false
});

// 搜索逻辑
const fetchProducts = async () => {
  loading.value = true;
  // 更新当前显示的搜索词
  currentKeyword.value = route.query.keyword || ''; 
  
  try {
    const response = await axios.get(`http://localhost:8081/api/products/search?keyword=${currentKeyword.value}`);
    if (response.data.code === 200) {
      productList.value = response.data.data;
    }
  } catch (error) {
    console.error("连接后端失败了:", error);
  } finally {
    loading.value = false;
  }
};

// 排序和跳转的占位方法 (防止报错)
const changeSort = (type) => { currentSort.value = type; };
const goToDetail = (id) => { console.log("去详情页:", id); };
const addToCart = (item) => { alert("已加入购物车: " + item.name); };

onMounted(() => { fetchProducts(); });
watch(() => route.query.keyword, () => { fetchProducts(); });
</script>

<style scoped>
/* 最外层容器居中限制宽度 */
.product-list-page {
  width: 1200px;
  margin: 0 auto;
  padding: 20px 0;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
}

.breadcrumb {
  margin-bottom: 15px;
  font-size: 14px;
  color: #666;
}
.breadcrumb .keyword {
  color: #E1251B;
  font-weight: bold;
}

/* 筛选工具栏样式 */
.filter-toolbar {
  background: #fff;
  border: 1px solid #eee;
  margin-bottom: 20px;
}
.filter-row {
  display: flex;
  padding: 10px 15px;
  border-bottom: 1px dashed #eee;
}
.filter-label {
  color: #999;
  width: 60px;
  font-size: 13px;
  line-height: 24px;
}
.filter-options {
  flex: 1;
  display: flex;
  gap: 20px;
}
.filter-options .option {
  font-size: 13px;
  cursor: pointer;
}
.filter-options .option:hover {
  color: #ff6700;
}

.sort-row {
  display: flex;
  justify-content: space-between;
  background: #f1f1f1;
  padding: 8px 15px;
}
.sort-group span {
  display: inline-block;
  padding: 4px 15px;
  margin-right: -1px;
  border: 1px solid #ccc;
  background: #fff;
  font-size: 12px;
  cursor: pointer;
}
.sort-group span.active {
  background: #ff6700;
  color: #fff;
  border-color: #ff6700;
}
.filter-checkboxes label {
  font-size: 12px;
  margin-left: 15px;
  cursor: pointer;
}

/* 瀑布流网格布局 (核心) */
.product-grid {
  display: grid;
  /* 使用 grid 自动填充，每列宽度230px，间距12px */
  grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
  gap: 12px;
}

/* 单个商品卡片 */
.product-card {
  background: #fff;
  border: 1px solid #f1f1f1;
  padding: 10px;
  transition: all 0.2s;
  cursor: pointer;
  display: flex;
  flex-direction: column;
}
.product-card:hover {
  border-color: #ff6700;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  transform: translateY(-2px);
}

.img-wrapper {
  width: 100%;
  aspect-ratio: 1 / 1; /* 强制图片为正方形 */
  overflow: hidden;
  margin-bottom: 10px;
}
.img-wrapper img {
  width: 100%;
  height: 100%;
  object-fit: cover; /* 保证图片不拉伸变形 */
}

.price-row {
  color: #ff6700;
  margin-bottom: 8px;
}
.price-row .currency {
  font-size: 14px;
}
.price-row .price {
  font-size: 20px;
  font-weight: bold;
}

.title-row {
  font-size: 13px;
  line-height: 1.5;
  height: 38px; /* 固定高度，两行文字 */
  margin-bottom: 8px;
  /* 实现多行文本超出显示省略号 */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
  color: #333;
}
.tag.self-operated {
  background: #ff6700;
  color: #fff;
  font-size: 12px;
  padding: 1px 4px;
  border-radius: 3px;
  margin-right: 5px;
}
.title-row:hover .name {
  color: #ff6700;
}

.info-row {
  font-size: 12px;
  color: #999;
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}

.action-row {
  margin-top: auto; /* 将按钮推到卡片最底部 */
}
.add-to-cart {
  width: 100%;
  padding: 6px 0;
  background: #fff;
  border: 1px solid #ccc;
  color: #666;
  border-radius: 15px;
  cursor: pointer;
  transition: all 0.2s;
}
.product-card:hover .add-to-cart {
  background: #ff6700;
  border-color: #ff6700;
  color: #fff;
}

.loading-state, .empty-state {
  text-align: center;
  padding: 50px 0;
  color: #999;
  font-size: 16px;
}
</style>