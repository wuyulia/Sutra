<template>
  <div class="breadcrumb">
    <router-link to="/mall">首页</router-link> > 
    <a href="#">{{ category }}</a> > 
    <span>{{ productName }}</span>
  </div>
</template>

<script setup>
defineProps({
  category: {
    type: String,
    default: '狗狗主粮'
  },
  productName: {
    type: String,
    required: true
  }
})
</script>

<style scoped>
.breadcrumb {
  padding: 20px 0;
  color: #666;
  font-size: 14px;
}
.breadcrumb a {
  color: #666;
  text-decoration: none;
}
.breadcrumb a:hover {
  color: #ff6700;
}
.breadcrumb span {
  color: #333;
}
</style>