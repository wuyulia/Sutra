<template>
  <div class="cs-popup" v-show="show">
    <div class="cs-header">
      <div class="cs-tabs">
        <span 
          class="cs-tab" 
          :class="{ active: activeTab === 'online' }"
          @click="activeTab = 'online'"
        >在线客服</span>
        <span 
          class="cs-tab" 
          :class="{ active: activeTab === 'faq' }"
          @click="activeTab = 'faq'"
        >常见问题</span>
      </div>
      <i class="fas fa-times" @click="$emit('close')"></i>
    </div>
    
    <!-- 在线客服标签页 -->
    <OnlineService 
      v-show="activeTab === 'online'"
      @start-chat="handleStartChat"
    />
    
    <!-- 常见问题标签页 -->
    <FaqList 
      v-show="activeTab === 'faq'"
      :faq-list="faqList"
    />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import OnlineService from './OnlineService.vue'
import FaqList from './FaqList.vue'

const props = defineProps({
  show: {
    type: Boolean,
    default: false
  }
})

const emit = defineEmits(['close', 'start-chat'])

const activeTab = ref('online')

// FAQ数据
const faqList = ref([
  {
    question: '如何查询订单物流信息？',
    answer: '登录后进入"我的订单"，点击对应订单的"查看物流"即可查询详细物流信息。',
    open: false
  },
  {
    question: '支持哪些支付方式？',
    answer: '我们支持微信支付、支付宝、银行卡等多种支付方式。',
    open: false
  },
  {
    question: '退货退款流程是怎样的？',
    answer: '在收到商品7天内，可通过"我的订单"申请退货，审核通过后将安排上门取件。',
    open: false
  },
  {
    question: '如何联系人工客服？',
    answer: '您可以拨打客服热线400-123-4567，或点击"在线咨询"与人工客服对话。',
    open: false
  }
])

const handleStartChat = (type) => {
  emit('start-chat', type)
}
</script>

<style scoped>
.cs-popup {
  position: absolute;
  right: 100%;
  top: 50%;
  transform: translateY(-50%);
  margin-right: 15px;
  width: 320px;
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 5px 20px rgba(0,0,0,0.2);
  z-index: 101;
  overflow: hidden;
}

.cs-header {
  padding: 0 20px;
  background-color: #ff6700;
  color: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.cs-tabs {
  display: flex;
  gap: 20px;
}

.cs-tab {
  padding: 15px 0;
  cursor: pointer;
  font-size: 14px;
  border-bottom: 2px solid transparent;
  transition: all 0.2s;
}

.cs-tab.active {
  border-bottom-color: white;
  font-weight: 500;
}

.cs-header i {
  cursor: pointer;
  font-size: 16px;
  opacity: 0.8;
  transition: opacity 0.2s;
}

.cs-header i:hover {
  opacity: 1;
}
</style>