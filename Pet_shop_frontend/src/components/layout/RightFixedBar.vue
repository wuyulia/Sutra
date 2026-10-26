<template>
  <div class="right-fixed-bar">
    <!-- 购物车 -->
    <div class="bar-item cart-item" @click="goToCart">
      <i class="fas fa-shopping-bag"></i>
      <span>购物车</span>
    </div>

    <!-- 新增：AI调研 -->
    <div class="bar-item ai-survey-item" @click="goToSurvey">
      <i class="fas fa-clipboard-list"></i>
      <span>AI调研</span>
      <!-- 可以加一个"New"的小标签 -->
      <span class="new-tag">New</span>
    </div>
    
    <!-- 客服选项 -->
    <div class="bar-item" @click="toggleCustomerService">
      <i class="fas fa-headset"></i>
      <span>客服</span>
      <span class="badge" v-if="hasUnreadMessages">3</span>
    </div>
    
    <!-- APP选项 -->
    <div class="bar-item app-item" @mouseenter="showQrcode = true" @mouseleave="showQrcode = false">
      <i class="fas fa-qrcode"></i>
      <span>APP</span>
      
      <div class="qrcode-popup" v-show="showQrcode">
        <div class="qrcode-wrapper">
          <img src="/src/assets/images/1772689633695.png" alt="APP二维码" class="qrcode-img">
          <p class="qrcode-text">扫码下载客户端</p>
        </div>
        <div class="popup-arrow"></div>
      </div>
    </div>
    
    <!-- 回到顶部 -->
    <div class="bar-item" @click="scrollToTop">
      <i class="fas fa-arrow-up"></i>
      <span>顶部</span>
    </div>

    <!-- 客服弹窗组件 -->
    <CustomerServicePopup 
      :show="showCustomerService"
      @close="showCustomerService = false"
      @start-chat="handleStartChat"
    />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router' // 如果你使用的是 vue-router
import CustomerServicePopup from '../service/CustomerServicePopup.vue'

const router = useRouter()
const showQrcode = ref(false)
const showCustomerService = ref(false)
const hasUnreadMessages = ref(true)

// 跳转到调研页面的函数
const goToSurvey = () => {
  // 方式 A: 如果是站内路由页面
  router.push('/survey') 
  
  // 方式 B: 如果是外部问卷链接（如问卷星、腾讯问卷）
  // window.open('https://your-survey-link.com', '_blank')
}

// 跳转到购物车页面的函数
const goToCart = () => {
  router.push('/cart')
}

const toggleCustomerService = () => {
  showCustomerService.value = !showCustomerService.value
  if (showCustomerService.value) {
    hasUnreadMessages.value = false
  }
}

const handleStartChat = (type) => {
  console.log('开始咨询：', type)
  alert(`即将开始${type}对话`)
}

const scrollToTop = () => {
  window.scrollTo({ top: 0, behavior: 'smooth' })
}
</script>

<style scoped>
.right-fixed-bar { 
  position: fixed; 
  right: 0; 
  top: 50%; 
  transform: translateY(-50%); 
  width: 80px; 
  background-color: #fff; 
  box-shadow: -2px 0 8px rgba(0,0,0,0.1); 
  z-index: 100; 
  display: flex; 
  flex-direction: column; 
  border-radius: 8px 0 0 8px; 
}

.right-fixed-bar { 
  position: fixed; 
  right: 0; 
  top: 50%; 
  transform: translateY(-50%); 
  width: 80px; 
  background-color: #fff; 
  box-shadow: -2px 0 8px rgba(0,0,0,0.1); 
  z-index: 100; 
  display: flex; 
  flex-direction: column; 
  border-radius: 8px 0 0 8px; 
}

/* 购物车和AI调研的高亮色 */
.cart-item, .ai-survey-item { color: #ff0000; }

/* AI调研专属：New 标签样式 */
.new-tag {
  position: absolute;
  top: 5px;
  right: 5px;
  background-color: #ff4444;
  color: #fff;
  font-size: 10px;
  padding: 0 4px;
  border-radius: 4px;
  transform: scale(0.8);
}

.bar-item { 
  height: 80px; 
  display: flex; 
  flex-direction: column; 
  align-items: center; 
  justify-content: center; 
  border-bottom: 1px solid #f5f5f5; 
  cursor: pointer; 
  color: #666; 
  transition: 0.2s; 
  position: relative;
}

.bar-item:hover { color: #ff6700; }
.bar-item i { font-size: 24px; margin-bottom: 5px; }
.bar-item span { font-size: 12px; }
.bar-item.cart-item { color: #ff6700; }

/* 未读消息小红点 */
.badge {
  position: absolute;
  top: 15px;
  right: 15px;
  background-color: #ff4444;
  color: white;
  font-size: 10px;
  padding: 2px 5px;
  border-radius: 10px;
  min-width: 16px;
  text-align: center;
}

/* 二维码弹窗样式（保持不变） */
.qrcode-popup {
  position: absolute;
  right: 100%;
  top: 50%;
  transform: translateY(-50%);
  margin-right: 15px;
  background-color: #fff;
  box-shadow: 0 2px 10px rgba(0,0,0,0.15);
  border-radius: 8px;
  padding: 15px;
  z-index: 101;
  animation: fadeIn 0.3s ease;
}

.popup-arrow {
  position: absolute;
  right: -6px;
  top: 50%;
  transform: translateY(-50%);
  width: 12px;
  height: 12px;
  background-color: #fff;
  transform: translateY(-50%) rotate(45deg);
  box-shadow: 2px -2px 5px rgba(0,0,0,0.05);
}

.qrcode-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
}

.qrcode-img {
  width: 120px;
  height: 120px;
  display: block;
}

.qrcode-text {
  font-size: 12px;
  color: #666;
  margin: 0;
  white-space: nowrap;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(-50%) translateX(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(-50%) translateX(0);
  }
}

.app-item {
  position: relative;
}
</style>