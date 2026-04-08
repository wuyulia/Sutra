<template>
  <div class="action-area">
    <el-button 
      type="primary" 
      size="large" 
      class="btn-pay" 
      :loading="loading"
      :disabled="disabled"
      @click="handlePay"
    >
      立即支付 ¥{{ amount }}
    </el-button>
  </div>
</template>

<script setup>
const props = defineProps({
  amount: {
    type: String,
    required: true
  },
  loading: {
    type: Boolean,
    default: false
  },
  disabled: {
    type: Boolean,
    default: false
  }
})

const emit = defineEmits(['pay'])

const handlePay = () => {
  emit('pay')
}
</script>

<style scoped>
.action-area {
  margin-top: 30px;
  text-align: right;
}
.btn-pay {
  background-color: #ff6700;
  border-color: #ff6700;
  font-size: 18px;
  padding: 25px 50px;
  border-radius: 4px;
}
.btn-pay:hover {
  background-color: #e65c00;
  border-color: #e65c00;
}
</style>