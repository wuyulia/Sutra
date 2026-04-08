<template>
  <div class="cart-container">
    <h2>我的购物车</h2>
    <!-- 这里后续写购物车的具体内容，比如商品列表、结算按钮等 -->
    <div class="empty-cart" v-if="cartList.length === 0">
      购物车空空如也，快去给主子挑点好东西吧！
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

// 模拟购物车数据
const cartList = ref([]) 
</script>

<style scoped>
.cart-container {
  padding: 20px;
  max-width: 1200px;
  margin: 0 auto;
}
/* 这里写当前页面的样式 */
</style>