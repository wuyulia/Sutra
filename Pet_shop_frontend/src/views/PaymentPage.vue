<!-- 支付页面 -->
<template>
  <div class="payment-container">
    <!-- 顶部简单的导航条 -->
    <PaymentHeader />

    <div class="main-content">
      <!-- 1. 订单信息与倒计时 -->
      <OrderSummary
        :order-amount="orderAmount"
        :shipping-info="shippingInfo"
        :expire-minutes="expireMinutes"
      />

      <!-- 2. 支付方式选择 -->
      <PaymentMethods v-model="selectedMethod" />

      <!-- 3. 确认支付按钮 -->
      <PayButton :amount="orderAmount" :loading="isPaying" @pay="handlePay" />
    </div>

    <!-- 4. 右侧悬浮侧边栏组件 -->
    <RightFixedBar />

    <FooterBar v-if="showFooter" />
    <!-- 引入footer栏 -->
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ElNotification } from 'element-plus'
import FooterBar from '@/components/layout/FooterBar.vue'
// 组件导入
import PaymentHeader from '@/components/payment/PaymentHeader.vue'
import OrderSummary from '@/components/payment/OrderSummary.vue'
import PaymentMethods from '@/components/payment/PaymentMethods.vue'
import PayButton from '@/components/payment/PayButton.vue'
import RightFixedBar from '@/components/layout/RightFixedBar.vue'

const route = useRoute()
const router = useRouter()
const showFooter = ref(true)

// 模拟订单数据
const orderId = ref(route.params.orderId || 'ORD202310248888')
const orderAmount = ref('899.00')
const shippingInfo = ref('张三 138****8888 | 广东省深圳市南山区科技园')
const expireMinutes = ref(15)

// 支付状态
const selectedMethod = ref('alipay')
const isPaying = ref(false)

// 处理支付逻辑
const handlePay = () => {
  isPaying.value = true

  // 模拟请求后端支付接口的延迟
  setTimeout(() => {
    isPaying.value = false

    // 支付成功提示
    ElNotification({
      title: '支付成功',
      message: `您已成功使用 ${getPlatformName()} 支付 ¥${orderAmount.value}`,
      type: 'success',
      duration: 3000,
    })

    // 支付成功后，跳转到“支付成功页”或“订单列表页”
    // router.push('/pay-success')
  }, 1500)
}

// 辅助函数：获取支付平台中文名
const getPlatformName = () => {
  const map = {
    alipay: '支付宝',
    wechat: '微信支付',
    unionpay: '银联',
  }
  return map[selectedMethod.value]
}
</script>

<style scoped>
.payment-container {
  background-color: #f5f7fa;
  min-height: 100vh;
  padding-bottom: 50px;
}

.main-content {
  max-width: 1200px;
  margin: 0 auto;
}
</style>
