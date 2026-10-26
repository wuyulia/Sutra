<template>
  <div class="sidebar">
    <div class="sidebar-title">常见问题分类</div>
    <div v-for="item in menuItems" :key="item" class="sidebar-item">
      {{ item }}
      <span class="arrow">▶</span>
    </div>
  </div>
</template>

<script setup>
const menuItems = ['购物指南', '订单百事通', '配送方式', '支付问题', '发票问题', '售后服务', '账户及会员', '特色服务', '历史规则'];
</script>

<style scoped>
.sidebar { width: 200px; background: #f5f5f5; padding: 10px; }
.sidebar-title { background: #5cb85c; color: white; padding: 10px; font-weight: bold; text-align: center; }
.sidebar-item { padding: 12px; border-bottom: 1px solid #ddd; cursor: pointer; display: flex; justify-content: space-between; }
</style>