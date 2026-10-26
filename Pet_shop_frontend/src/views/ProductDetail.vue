<!-- 商品详情页 -->
<template>
  <div class="product-detail-container" v-if="!loading"> <!-- 【改动1】：增加 loading 判断，防止数据没回来时子组件报错 -->
    <HeaderBar v-if="showHeader" />

    <div class="container">
      <!-- 1. 面包屑导航 -->
      <Breadcrumb :productName="product.name" />

      <!-- 2. 核心详情区 -->
      <div class="detail-core">
        <!-- 左侧：图片画廊 -->
        <!-- 【改动2】：images 动态绑定 -->
        <ProductGallery :images="productImages" @update:currentImage="handleImageChange" />

        <!-- 右侧：商品信息与交互 -->
        <!-- 【改动3】：将获取到的 product 和 skuList 传给子组件 -->
        <ProductInfo 
          :product="product" 
          :skuList="skuList"
          @add-to-cart="handleAddToCart" 
          @buy-now="handleBuyNow" 
        />
      </div>

      <!-- 3. 底部：详情描述与评价 -->
      <ProductTabs>
        <div class="split-detail-section">
          <div class="container split-container">
            <!-- 左侧：商品详情 -->
            <div class="scroll-pane left-pane">
              <div class="pane-title">商品详情</div>
              <div class="pane-content">
                <ShopInfoCard />
                <ProductParamsTable />

                <!-- 【改动4】：这里动态渲染后端返回的 HTML 详情 -->
                <div class="detail-images" v-html="product.detailHtml || '暂无图文详情'">
                </div>
              </div>
            </div>

            <!-- 右侧：用户评价 -->
            <div class="scroll-pane right-pane">
              <div class="pane-title">用户评价 (99+)</div>
              <div class="pane-content">
                <UserReviewList />
              </div>
            </div>
          </div>
        </div>
      </ProductTabs>
    </div>

    <RightFixedBar />
    <FooterBar v-if="showFooter" />
  </div>
  
  <!-- 加载状态 -->
  <div v-else class="loading-full-screen">加载中...</div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue' // 引入 computed
import { useRoute, useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import axios from 'axios' // 【改动5】：引入 axios

// 公共组件引用保持不变...
import HeaderBar from '@/components/layout/HeaderBar.vue'
import FooterBar from '@/components/layout/FooterBar.vue'
import Breadcrumb from '@/components/common/Breadcrumb.vue'
import ProductGallery from '@/components/product/ProductGallery.vue'
import ProductInfo from '@/components/product/ProductInfo.vue'
import RightFixedBar from '@/components/layout/RightFixedBar.vue'
import ProductTabs from '@/components/product/ProductTabs.vue'
import ProductCard from '@/components/product/ProductCard.vue'
import ShopInfoCard from '@/components/product/ShopInfoCard.vue'
import ProductParamsTable from '@/components/product/ProductParamsTable.vue'
import UserReviewList from '@/components/product/UserReviewList.vue'

const route = useRoute()
const router = useRouter()
const productId = ref(route.params.id)

const showHeader = ref(true)
const showFooter = ref(true)
const loading = ref(true) // 加载状态

// --- 核心数据 ---
const product = ref({})     // 存储 SPU
const skuList = ref([])      // 存储 SKU 列表
const hotGoods = ref([])     // 推荐商品

// 【改动6】：计算属性，将主图和SKU图合并成一个图片数组给 Gallery 组件
const productImages = computed(() => {
  if (!product.value.coverImg) return []
  const imgs = [product.value.coverImg]
  // 把有图片的 SKU 图也加进去
  skuList.value.forEach(sku => {
    if (sku.skuImg) imgs.push(sku.skuImg)
  })
  return imgs
})

// 【改动7】：从后端获取真实数据
const fetchDetailData = async () => {
  loading.value = true
  try {
    const res = await axios.get(`http://localhost:8081/api/products/${productId.value}`)
    if (res.data.code === 200) {
      product.value = res.data.data.product
      skuList.value = res.data.data.skus
      
      // 为了兼容你原来的 ProductInfo 组件，我们可以手动给 product 补上一些字段
      // 比如把 SKU 的规格值提取出来变成 flavors 数组
      product.value.flavors = skuList.value.map(s => s.specValue)
    }
  } catch (error) {
    ElMessage.error('获取商品详情失败')
  } finally {
    loading.value = false
  }
}

// 模拟热门商品（这个你可以保留，或者也改成从后端获取）
const fetchHotGoods = () => {
  hotGoods.value = [
     { id: 1, title: '皇家(Royal Canin) 小型犬成犬粮 2kg', price: '128.00', sales: '200+' },
     // ... 其他数据保持不变
  ]
}

// --- 事件处理 ---
const handleImageChange = (img) => {
  console.log('当前图片已切换:', img)
}

const handleAddToCart = (data) => {
  // data 现在包含用户在 ProductInfo 里选中的具体 SKU 信息
  console.log('加入购物车:', data)
  ElMessage.success('已加入购物车')
}

const handleBuyNow = (data) => {
  // 带着选择的 SKU 价格和数量去支付
  const totalAmount = (parseFloat(data.price) * data.quantity).toFixed(2)
  router.push({
    path: '/payment',
    query: {
      orderId: 'ORD' + new Date().getTime(),
      amount: totalAmount,
      skuId: data.skuId // 记得把用户选的具体规格ID带走
    },
  })
}

// --- 初始化 ---
onMounted(() => {
  fetchDetailData()
  fetchHotGoods()
})
</script>

<style scoped>
/* 原有样式完全保留，只需增加一个加载状态的样式 */
.loading-full-screen {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  font-size: 18px;
  color: #999;
}
.product-detail-container {
  background-color: #f5f5f5;
  min-height: 100vh;
  padding-bottom: 50px;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
}

.detail-core {
  background: #fff;
  border-radius: 12px;
  padding: 30px;
  display: flex;
  gap: 50px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}
/* 商品栏格式 */
.goods-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 15px;
}
.container_goods {
  width: 1200px;
  margin: 0 auto;
}

/* 容器布局 */
.split-container {
  display: flex;
  gap: 20px;
  height: 800px; /* 必须给一个固定高度，左右才能独立滚动 */
  margin-top: 30px;
}

.scroll-pane {
  flex: 1;
  background: #fff;
  border-radius: 12px;
  display: flex;
  flex-direction: column;
  overflow: hidden; /* 防止溢出 */
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.pane-title {
  padding: 15px 25px;
  font-size: 18px;
  font-weight: bold;
  border-bottom: 2px solid #ff6700;
  width: fit-content;
  margin-bottom: 10px;
}

/* 独立滚动区域 */
.pane-content {
  flex: 1;
  overflow-y: auto; /* 开启纵向滚动 */
  padding: 20px;
  padding-right: 15px; /* 给滚动条留点空间 */
}

/* --- 自定义滚动条样式 (对应图三效果) --- */
/* 1. 滚动条整体 */
.pane-content::-webkit-scrollbar {
  width: 10px; /* 宽度 */
}

/* 2. 滚动条轨道 (背景) */
.pane-content::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 10px;
}

/* 3. 滚动条滑块 (滑块本身) */
.pane-content::-webkit-scrollbar-thumb {
  background: #999; /* 深灰色 */
  border-radius: 10px;
  border: 2px solid #f1f1f1; /* 边框让滑块看起来更瘦一点 */
}

/* 4. 滑块悬停效果 */
.pane-content::-webkit-scrollbar-thumb:hover {
  background: #666;
}

/* 图片适配 */
.detail-images img {
  width: 100%;
  border-radius: 8px;
  margin-bottom: 10px;
  display: block;
}


</style>