<template>
  <div class="info">
    <h1 class="product-title">{{ product.name }}</h1>
    <p class="product-desc">{{ product.description }}</p>
    
    <div class="price-box">
      <span class="label">促销价</span>
      <span class="symbol">¥</span>
      <span class="price">{{ product.price }}</span>
      <span class="original-price">¥{{ product.originalPrice }}</span>
    </div>

    <div class="specs">
      <!-- 规格选择 (例如：口味/重量) -->
      <div class="spec-row">
        <span class="spec-label">口味</span>
        <div class="spec-options">
          <span 
            class="spec-btn" 
            v-for="(flavor, index) in product.flavors" 
            :key="index"
            :class="{ active: selectedFlavor === flavor }"
            @click="selectFlavor(flavor)"
          >
            {{ flavor }}
          </span>
        </div>
      </div>

      <!-- 数量选择 -->
      <div class="spec-row">
        <span class="spec-label">数量</span>
        <el-input-number v-model="localQuantity" :min="1" :max="99" size="large" />
        <span class="stock-info">库存 {{ product.stock }} 件</span>
      </div>
    </div>

    <!-- 购买按钮 -->
    <div class="action-buttons">
      <el-button size="large" class="btn-cart" @click="addToCart">加入购物车</el-button>
      <el-button type="primary" size="large" class="btn-buy" @click="buyNow">立即购买</el-button>
    </div>
    
    <!-- 服务承诺 -->
    <ServiceTags />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { ElMessage } from 'element-plus'
import ServiceTags from '../service/ServiceTags.vue'

const props = defineProps({
  product: {
    type: Object,
    required: true
  }
})

const emit = defineEmits(['add-to-cart', 'buy-now'])

const selectedFlavor = ref(props.product.flavors[0])
const localQuantity = ref(1)

const selectFlavor = (flavor) => {
  selectedFlavor.value = flavor
}

const addToCart = () => {
  emit('add-to-cart', {
    flavor: selectedFlavor.value,
    quantity: localQuantity.value
  })
  ElMessage({
    message: `成功将 ${localQuantity.value} 件商品加入购物车！`,
    type: 'success',
  })
}

const buyNow = () => {
  emit('buy-now', {
    flavor: selectedFlavor.value,
    quantity: localQuantity.value
  })
  ElMessage({
    message: `准备结算：${selectedFlavor.value} x ${localQuantity.value}`,
    type: 'warning',
  })
}
</script>

<style scoped>
.info {
  flex: 1;
}
.product-title {
  font-size: 24px;
  color: #333;
  margin-bottom: 10px;
  line-height: 1.4;
}
.product-desc {
  color: #ff6700;
  font-size: 14px;
  margin-bottom: 20px;
}
.price-box {
  background: #fff0e6;
  padding: 20px;
  border-radius: 8px;
  margin-bottom: 25px;
  display: flex;
  align-items: baseline;
}
.price-box .label { color: #666; margin-right: 15px; }
.price-box .symbol { color: #ff6700; font-size: 18px; font-weight: bold; }
.price-box .price { color: #ff6700; font-size: 32px; font-weight: bold; }
.price-box .original-price { color: #999; text-decoration: line-through; margin-left: 15px; font-size: 14px; }
.specs {
  margin-bottom: 30px;
}
.spec-row {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}
.spec-label {
  width: 60px;
  color: #666;
  font-size: 14px;
}
.spec-options {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}
.spec-btn {
  padding: 8px 20px;
  border: 1px solid #ddd;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
  color: #333;
  transition: all 0.2s;
}
.spec-btn:hover {
  border-color: #ff6700;
  color: #ff6700;
}
.spec-btn.active {
  border-color: #ff6700;
  color: #ff6700;
  background: #fff0e6;
}
.stock-info {
  margin-left: 15px;
  color: #999;
  font-size: 14px;
}
.action-buttons {
  display: flex;
  gap: 20px;
  margin-bottom: 30px;
}
.btn-cart {
  width: 180px;
  border-color: #ff6700;
  color: #ff6700;
}
.btn-cart:hover {
  background: #fff0e6;
  border-color: #ff6700;
  color: #ff6700;
}
.btn-buy {
  width: 180px;
  background-color: #ff6700;
  border-color: #ff6700;
}
.btn-buy:hover {
  background-color: #e65c00;
}
</style>