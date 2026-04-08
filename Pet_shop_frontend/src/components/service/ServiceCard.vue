<template>
  <div class="service-card">
    <div class="icon-box">
      <slot name="icon"><i class="fas fa-concierge-bell"></i></slot>
    </div>
    <div class="info">
      <h3 class="title">{{ title || '服务名称' }}</h3>
      <p class="desc">{{ desc || '服务描述内容' }}</p>
    </div>
  </div>
</template>

<script setup>
defineProps({
  title: String,
  desc: String
})
</script>

<style scoped>
.service-card {
  padding: 20px;
  background: #fff;
  border-radius: 8px;
  display: flex;
  align-items: center;
  gap: 15px;
  border: 1px solid #eee;
}
.icon-box {
  font-size: 24px;
  color: #ff6700;
}
.title { font-size: 16px; margin-bottom: 5px; }
.desc { font-size: 12px; color: #999; }
</style>