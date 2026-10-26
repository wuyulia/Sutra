<template>
  <div class="goods-card" @click="goToDetail">
    <div class="goods-img-placeholder">
      <i class="fas fa-image fa-3x"></i>
    </div>
    <div class="goods-title">{{ product.title }}</div>
    <div class="goods-price">¥ {{ product.price }}</div>
    <div class="goods-sales">月销 {{ product.sales }}</div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'

const props = defineProps({
  product: {
    type: Object,
    required: true
  }
})

const router = useRouter()

const goToDetail = () => {
  router.push(`/product/${props.product.id}`)
}
</script>

<style scoped>
.goods-card {
  background: #fff;
  padding: 20px;
  transition: all 0.3s;
  cursor: pointer;
  position: relative;
}
.goods-card:hover {
  box-shadow: 0 15px 30px rgba(0,0,0,0.1);
  transform: translateY(-2px);
}

.goods-img-placeholder {
  width: 100%;
  height: 100px;
  background-color: #f9f9f9;
  margin-bottom: 15px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #ddd;
}
.goods-title {
  font-size: 14px;
  color: #333;
  margin-bottom: 10px;
  height: 40px;
  overflow: hidden;
  line-height: 1.4;
}
.goods-price {
  color: #ff6700;
  font-size: 18px;
  font-weight: bold;
}
.goods-sales {
  font-size: 12px;
  color: #aaa;
  float: right;
  margin-top: 5px;
}
</style>


