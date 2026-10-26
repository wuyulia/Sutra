<template>
  <HeaderBar />
  <RightFixedBar />

  <div class="cart-page">
    <!-- 1. 页面头部 -->
    <div class="cart-header">
      <h2>
        全部商品 <span class="cart-count">{{ cartList.length }}</span>
      </h2>
      <div class="header-actions">
        <!-- 预留的管理按钮，例如点击后批量删除 -->
        <button class="action-btn" v-if="cartList.length > 0" @click="toggleManagement">
          {{ isManagementMode ? '完成' : '管理' }}
        </button>
      </div>
    </div>

    <!-- 2. 购物车内容区域 -->
    <div class="cart-content" v-if="cartList.length > 0">
      <!-- 表头栏 -->
      <div class="cart-table-header">
        <div class="col-check">
          <input
            type="checkbox"
            v-model="isAllSelected"
            @change="handleSelectAll"
            id="selectAllTop"
          />
          <label for="selectAllTop">全选</label>
        </div>
        <div class="col-info">商品信息</div>
        <div class="col-price">单价</div>
        <div class="col-quantity">数量</div>
        <div class="col-sum">金额</div>
        <div class="col-action">操作</div>
      </div>

      <!-- 👇 商品列表区域（供日后插入子组件） 👇 -->
      <div class="cart-item-list">
        <!-- 
          TODO: 日后在这里循环引入你的 CartItem 组件 
          示例：
          <CartItem 
            v-for="item in cartList" 
            :key="item.id" 
            :itemData="item" 
            @update-quantity="handleQuantityChange"
            @delete-item="handleDelete"
          />
        -->

        <!-- 临时占位，方便你看布局效果 -->
        <div class="placeholder-box">
          <p>【这里是你日后要放置的子组件区域】</p>
          <p>通过循环 cartList 渲染每个商品项</p>
        </div>
      </div>
      <!-- 👆 商品列表区域结束 👆 -->
    </div>

    <!-- 3. 空状态 (当购物车没数据时显示) -->
    <div class="cart-empty" v-else>
      <i class="fas fa-shopping-cart empty-icon"></i>
      <p>购物车空空如也，快去给主子挑点好货吧！</p>
      <button class="go-shopping-btn" @click="goToHome">去逛逛</button>
    </div>

    <!-- 4. 底部固定结算台 -->
    <div class="cart-footer" v-if="cartList.length > 0">
      <div class="footer-left">
        <input
          type="checkbox"
          v-model="isAllSelected"
          @change="handleSelectAll"
          id="selectAllBottom"
        />
        <label for="selectAllBottom">全选</label>
        <span class="delete-selected">删除选中商品</span>
      </div>

      <div class="footer-right">
        <div class="summary">
          已选择 <span class="highlight-num">{{ selectedCount }}</span> 件商品
          <span class="total-label">总价：</span>
          <span class="total-price">¥{{ totalPrice.toFixed(2) }}</span>
        </div>
        <button class="checkout-btn" :disabled="selectedCount === 0" @click="handleCheckout">
          去结算
        </button>
      </div>
    </div>
  </div>
  <FooterBar />
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'

import { HeaderBar, FooterBar, RightFixedBar } from '@/components'

const router = useRouter()

// --- 模拟数据 ---
// 暂时给点假数据让框架显示出来，以后这里从后端或 Pinia 获取
const cartList = ref([
  { id: 1, name: '占位商品1' },
  { id: 2, name: '占位商品2' },
])

// --- 状态与计算属性 ---
const isAllSelected = ref(false)
const isManagementMode = ref(false)

// 模拟计算：已选商品数量（日后根据你真实子组件传回的状态计算）
const selectedCount = computed(() => {
  return isAllSelected.value ? cartList.value.length : 0
})

// 模拟计算：总价
const totalPrice = computed(() => {
  return isAllSelected.value ? 999.0 : 0.0
})

// --- 交互方法 ---
// 处理全选点击
const handleSelectAll = () => {
  console.log('触发全选状态切换:', isAllSelected.value)
  // 日后这里需要遍历 cartList，将所有 item.selected 设为 isAllSelected.value
}

// 切换管理模式
const toggleManagement = () => {
  isManagementMode.value = !isManagementMode.value
  console.log('管理模式:', isManagementMode.value)
}

// 结算跳转
const handleCheckout = () => {
  console.log('去结算，总价:', totalPrice.value)
  // router.push('/payment')
}

// 去逛逛
const goToHome = () => {
  router.push('/')
}
</script>

<style scoped>
.cart-page {
  width: 1200px;
  margin: 20px auto;
  min-height: 600px;
  color: #333;
  padding-bottom: 80px; /* 为固定的底部结算台留出空间 */
}

/* 1. 头部样式 */
.cart-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  margin-bottom: 20px;
  padding-bottom: 15px;
  border-bottom: 2px solid #f0f0f0;
}
.cart-header h2 {
  font-size: 24px;
  color: #ff6700;
  margin: 0;
  font-weight: 500;
}
.cart-count {
  font-size: 16px;
  font-weight: normal;
  color: #999;
  margin-left: 10px;
  background: #f5f5f5;
  padding: 2px 10px;
  border-radius: 12px;
}
.action-btn {
  cursor: pointer;
  color: #ff6700;
  background: transparent;
  border: 1px solid #ff6700;
  padding: 6px 16px;
  border-radius: 20px;
  font-size: 14px;
  transition: all 0.3s ease;
}
.action-btn:hover {
  background: #ff6700;
  color: #fff;
  transform: translateY(-1px);
  box-shadow: 0 2px 8px rgba(255, 103, 0, 0.3);
}

/* 2. 表头样式 */
.cart-table-header {
  display: flex;
  background: #f5f5f5;
  padding: 15px 20px;
  border-radius: 8px 8px 0 0;
  font-size: 14px;
  color: #666;
}
.col-check {
  width: 80px;
  display: flex;
  align-items: center;
  gap: 8px;
}
.col-info {
  flex: 1;
}
.col-price {
  width: 120px;
  text-align: center;
}
.col-quantity {
  width: 150px;
  text-align: center;
}
.col-sum {
  width: 120px;
  text-align: center;
}
.col-action {
  width: 100px;
  text-align: center;
}

/* 商品列表占位区 */
.cart-item-list {
  background: #fff;
  border: 1px solid #eee;
  border-top: none;
  border-radius: 0 0 8px 8px;
  padding: 20px;
  min-height: 200px;
}
.placeholder-box {
  border: 2px dashed #ccc;
  background: #fafafa;
  padding: 50px;
  text-align: center;
  color: #999;
  border-radius: 8px;
}

/* 3. 空状态样式 */
.cart-empty {
  background: #fff;
  padding: 100px 0;
  text-align: center;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}
.empty-icon {
  font-size: 60px;
  color: #ccc;
  margin-bottom: 20px;
}
.cart-empty p {
  color: #999;
  margin-bottom: 20px;
}
.go-shopping-btn {
  padding: 10px 30px;
  background: #ff6700;
  color: #fff;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  font-size: 16px;
}

/* 4. 底部结算台 (吸底效果) */
.cart-footer {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #fff;
  height: 60px;
  margin-top: 20px;
  padding: 0 20px;
  box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.05);
  z-index: 1000; /* 确保在最上层 */
}

.footer-left {
  display: flex;
  align-items: center;
  gap: 20px;
  font-size: 14px;
}
.delete-selected {
  cursor: pointer;
  color: #666;
}
.delete-selected:hover {
  color: #ff6700;
}

.footer-right {
  display: flex;
  align-items: center;
  height: 100%;
}
.summary {
  margin-right: 20px;
  font-size: 14px;
}
.highlight-num {
  color: #ff6700;
  font-weight: bold;
  margin: 0 5px;
  font-size: 16px;
}
.total-label {
  margin-left: 20px;
}
.total-price {
  color: #ff6700;
  font-size: 22px;
  font-weight: bold;
}

.checkout-btn {
  height: 100%;
  width: 120px;
  background: #ff6700;
  color: white;
  border: none;
  font-size: 18px;
  font-weight: bold;
  cursor: pointer;
  border-radius: 0 8px 8px 0;
}
.checkout-btn:disabled {
  background: #ccc;
  cursor: not-allowed;
}
</style>
