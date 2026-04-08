<template>
  <el-card class="payment-methods" shadow="never">
    <template #header>
      <div class="card-header">
        <span>选择支付方式</span>
      </div>
    </template>
    
    <div class="method-list">
      <!-- 支付宝 -->
      <div 
        v-for="method in paymentMethods"
        :key="method.id"
        class="method-item" 
        :class="{ active: modelValue === method.id }"
        @click="selectMethod(method.id)"
      >
        <div :class="['method-logo', method.id]">
          <i :class="method.icon"></i> {{ method.name }}
        </div>
        <div class="check-mark" v-if="modelValue === method.id">
          <el-icon><Select /></el-icon>
        </div>
      </div>
    </div>
  </el-card>
</template>

<script setup>
import { Select } from '@element-plus/icons-vue'

const props = defineProps({
  modelValue: {
    type: String,
    required: true
  }
})

const emit = defineEmits(['update:modelValue'])

// 支付方式配置
const paymentMethods = [
  {
    id: 'alipay',
    name: '支付宝支付',
    icon: 'fab fa-alipay'
  },
  {
    id: 'wechat',
    name: '微信支付',
    icon: 'fab fa-weixin'
  },
  {
    id: 'unionpay',
    name: '银联云闪付',
    icon: 'fas fa-credit-card'
  }
]

const selectMethod = (methodId) => {
  emit('update:modelValue', methodId)
}
</script>

<style scoped>
.payment-methods {
  border-radius: 8px;
}
.card-header {
  font-size: 18px;
  font-weight: bold;
  color: #333;
}
.method-list {
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
  padding: 10px 0;
}

.method-item {
  width: 220px;
  height: 70px;
  border: 2px solid #e4e7ed;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  position: relative;
  transition: all 0.3s;
}
.method-item:hover {
  border-color: #c0c4cc;
}
.method-item.active {
  border-color: #ff6700;
}
.check-mark {
  position: absolute;
  bottom: 0;
  right: 0;
  background: #ff6700;
  color: #fff;
  padding: 2px;
  border-top-left-radius: 8px;
  font-size: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.method-logo {
  font-size: 18px;
  font-weight: bold;
  display: flex;
  align-items: center;
  gap: 8px;
}
.alipay { color: #1677ff; }
.wechat { color: #07c160; }
.unionpay { color: #e60012; }
</style>