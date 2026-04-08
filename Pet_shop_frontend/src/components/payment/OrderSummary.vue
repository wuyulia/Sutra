<template>
  <el-card class="order-summary" shadow="never">
    <div class="summary-left">
      <el-icon class="success-icon"><CircleCheckFilled /></el-icon>
      <div class="order-text">
        <h2>订单提交成功！去付款咯～</h2>
        <p>请在 <span class="highlight-time">{{ formattedTime }}</span> 内完成支付, 超时后将取消订单</p>
        <p class="order-no">收货信息：{{ shippingInfo }}</p>
      </div>
    </div>
    <div class="summary-right">
      <div class="amount-box">
        <span>应付总额：</span>
        <span class="rmb">¥</span>
        <span class="amount">{{ orderAmount }}</span>
      </div>
      <div class="order-detail-link" @click="viewOrderDetail">
        订单详情 <el-icon><ArrowDown /></el-icon>
      </div>
    </div>
  </el-card>
</template>

<script setup>
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import { CircleCheckFilled, ArrowDown } from '@element-plus/icons-vue'

const props = defineProps({
  orderAmount: {
    type: String,
    required: true
  },
  shippingInfo: {
    type: String,
    default: '张三 138****8888 | 广东省深圳市南山区科技园'
  },
  expireMinutes: {
    type: Number,
    default: 15
  }
})

const router = useRouter()

// 格式化倒计时时间
const formattedTime = computed(() => {
  return `${props.expireMinutes}分00秒`
})

// 查看订单详情
const viewOrderDetail = () => {
  router.push('/order-detail')
}
</script>

<style scoped>
.order-summary {
  margin-bottom: 20px;
  border-radius: 8px;
}
:deep(.order-summary .el-card__body) {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 30px;
}

.summary-left {
  display: flex;
  align-items: flex-start;
  gap: 20px;
}
.success-icon {
  font-size: 48px;
  color: #67c23a;
  margin-top: 5px;
}
.order-text h2 {
  margin: 0 0 10px 0;
  font-size: 22px;
  color: #333;
}
.order-text p {
  margin: 5px 0;
  color: #666;
  font-size: 14px;
}
.highlight-time {
  color: #ff6700;
  font-weight: bold;
  margin: 0 5px;
}
.order-no {
  margin-top: 10px !important;
  color: #999 !important;
}

.summary-right {
  text-align: right;
}
.amount-box {
  margin-bottom: 10px;
}
.amount-box span {
  color: #666;
}
.amount-box .rmb {
  color: #ff6700;
  font-size: 18px;
  font-weight: bold;
  margin-left: 10px;
}
.amount-box .amount {
  color: #ff6700;
  font-size: 32px;
  font-weight: bold;
}
.order-detail-link {
  font-size: 14px;
  color: #409eff;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 5px;
}
</style>