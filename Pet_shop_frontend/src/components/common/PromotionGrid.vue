<template>
  <div class="promotion-grid">
    <!-- 循环渲染卡片 -->
    <div 
      v-for="item in promotionList" 
      :key="item.id" 
      :class="['promo-card', item.size]"
      @click="handleJump(item)"
    >
      <!-- 动态内容 -->
      <div class="content">
        <h3>{{ item.title }}</h3>
        <p>{{ item.subtitle }}</p>
        <div v-if="item.price" class="price-tag">¥{{ item.price }}</div>
      </div>
      <img :src="item.image" :alt="item.title" />
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

// 模拟接口数据，后续你只需用 axios 替换这里
const promotionList = ref([
  { id: 1, title: '春游焕新季', subtitle: '券后8.1折起', image: '...', size: 'large', price: null },
  { id: 2, title: '百亿补贴', subtitle: '买贵必赔', image: '...', size: 'medium', price: 3880 },
  { id: 3, title: '领券中心', subtitle: '限时福利', image: '...', size: 'small', price: 4399 },
  { id: 4, title: '采购优选', subtitle: '工厂直发', image: '...', size: 'small', price: 12599 },
  { id: 5, title: '国家补贴', subtitle: '以旧换新', image: '...', size: 'small', price: 21999 },
  { id: 6, title: '国家补贴', subtitle: '以旧换新', image: '...', size: 'small', price: 21999 },
  { id: 7, title: '国家补贴', subtitle: '以旧换新', image: '...', size: 'small', price: 21999 },
  { id: 8, title: '国家补贴', subtitle: '以旧换新', image: '...', size: 'small', price: 21999 },
])

const handleJump = (item) => {
  // 跳转逻辑，连接后端 ID
  console.log('跳转至:', item.id)
}
</script>

<style scoped>
.promotion-grid {
  display: grid;
  /* 自动填充网格，实现错落有致的核心 */
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: 200px; /* 固定行高 */
  gap: 15px;
  width: 100%;
  margin: 0 auto;
}

.promo-card {
  border-radius: 12px;
  overflow: hidden;
  background: #f8f8f8;
  position: relative;
  transition: transform 0.3s;
  cursor: pointer;
  padding: 20px;
}

.promo-card:hover { transform: translateY(-5px); }

/* 控制不同大小的卡片 */
.large { grid-column: span 2; grid-row: span 2; background: #55b9a6; color: white; }
.medium { grid-column: span 1; grid-row: span 2; }
.small { grid-column: span 1; grid-row: span 1; }

.price-tag {
  background: #ff6700;
  color: white;
  padding: 4px 10px;
  border-radius: 20px;
  display: inline-block;
  margin-top: 10px;
}
</style>