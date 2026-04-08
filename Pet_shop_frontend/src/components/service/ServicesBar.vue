<template>
  <div class="services-bar">
    <div class="service-item" v-for="(svc, index) in topServices" :key="index">
      <i :class="['fas', svc.icon]"></i>
      <h4>{{ svc.title }}</h4>
      <p>{{ svc.desc }}</p>
    </div>
  </div>
</template>

<script setup>
defineProps({
  topServices: {
    type: Array,
    required: true
  }
})
</script>

<style scoped>
.services-bar {
  margin-top: 20px;
  background: #fff;
  padding: 30px 0;
  display: flex;
  justify-content: space-around;
  text-align: center;
}
.service-item i {
  font-size: 32px;
  color: #ff6700;
  margin-bottom: 10px;
}
.service-item h4 {
  margin-bottom: 5px;
}
.service-item p {
  color: #999;
  font-size: 14px;
}
</style>