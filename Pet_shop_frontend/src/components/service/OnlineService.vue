<template>
  <div class="cs-content">
    <div class="cs-service-list">
      <div 
        class="cs-service-item" 
        v-for="service in serviceTypes" 
        :key="service.type"
        @click="$emit('start-chat', service.type)"
      >
        <i :class="service.icon"></i>
        <span>{{ service.name }}</span>
      </div>
    </div>
    
    <div class="cs-contact-info">
      <p><i class="fas fa-phone"></i> 客服热线：400-123-4567</p>
      <p><i class="fas fa-clock"></i> 服务时间：24小时</p>
      <p><i class="fas fa-envelope"></i> 邮箱：service@example.com</p>
    </div>
    
    <!-- 在线客服状态 -->
    <div class="cs-online-status">
      <span class="status-dot"></span>
      <span>当前有3位客服在线</span>
    </div>
  </div>
</template>

<script setup>
defineEmits(['start-chat'])

const serviceTypes = [
  { type: 'presale', name: '售前咨询', icon: 'fas fa-shopping-cart' },
  { type: 'aftersale', name: '售后支持', icon: 'fas fa-tools' },
  { type: 'technical', name: '技术咨询', icon: 'fas fa-code' },
  { type: 'suggestion', name: '意见建议', icon: 'fas fa-lightbulb' }
]
</script>

<style scoped>
.cs-content {
  padding: 20px;
  max-height: 350px;
  overflow-y: auto;
}

.cs-service-list {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 10px;
  margin-bottom: 20px;
}

.cs-service-item {
  padding: 15px 10px;
  background-color: #f8f8f8;
  border-radius: 8px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  transition: all 0.2s;
}

.cs-service-item:hover {
  background-color: #fff5e6;
  color: #ff6700;
  transform: translateY(-2px);
}

.cs-service-item i {
  font-size: 24px;
}

.cs-service-item span {
  font-size: 12px;
}

.cs-contact-info {
  padding: 15px 0;
  border-top: 1px solid #f0f0f0;
  border-bottom: 1px solid #f0f0f0;
}

.cs-contact-info p {
  margin: 8px 0;
  font-size: 13px;
  color: #666;
  display: flex;
  align-items: center;
  gap: 8px;
}

.cs-contact-info i {
  width: 20px;
  color: #ff6700;
}

.cs-online-status {
  padding-top: 15px;
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 13px;
  color: #28a745;
}

.status-dot {
  width: 8px;
  height: 8px;
  background-color: #28a745;
  border-radius: 50%;
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0% {
    box-shadow: 0 0 0 0 rgba(40, 167, 69, 0.7);
  }
  70% {
    box-shadow: 0 0 0 6px rgba(40, 167, 69, 0);
  }
  100% {
    box-shadow: 0 0 0 0 rgba(40, 167, 69, 0);
  }
}
</style>