<template>
  <div class="detail-tabs">
    <div class="tab-header">
      <div 
        class="tab-item" 
        :class="{ active: activeTab === 'detail' }"
        @click="activeTab = 'detail'"
      >
        商品详情
      </div>
      <div 
        class="tab-item" 
        :class="{ active: activeTab === 'reviews' }"
        @click="activeTab = 'reviews'"
      >
        用户评价 (99+)
      </div>
    </div>
    <div class="tab-content">
      <slot :activeTab="activeTab"></slot>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const activeTab = ref('detail')
</script>

<style scoped>
.detail-tabs {
  margin-top: 30px;
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 4px 15px rgba(0,0,0,0.05);
  overflow: hidden;
}
.tab-header {
  display: flex;
  background: #fafafa;
  border-bottom: 1px solid #eee;
}
.tab-item {
  padding: 15px 40px;
  font-size: 16px;
  cursor: pointer;
  position: relative;
  color: #333;
}
.tab-item.active {
  color: #ff6700;
  font-weight: bold;
}
.tab-item.active::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 40px;
  height: 3px;
  background: #ff6700;
}
.tab-content {
  padding: 40px;
}
</style>