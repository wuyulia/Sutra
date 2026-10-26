<template>
  <div class="gallery">
    <div class="main-image">
      <img :src="currentImage" alt="商品主图">
    </div>
    <div class="thumbnail-list">
      <div 
        class="thumb-item" 
        v-for="(img, index) in images" 
        :key="index"
        :class="{ active: currentImage === img }"
        @mouseenter="updateCurrentImage(img)"
      >
        <img :src="img" alt="缩略图">
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const props = defineProps({
  images: {
    type: Array,
    required: true
  }
})

const emit = defineEmits(['update:currentImage'])

const currentImage = ref(props.images[0])

const updateCurrentImage = (img) => {
  currentImage.value = img
  emit('update:currentImage', img)
}
</script>

<style scoped>
.gallery {
  width: 450px;
  flex-shrink: 0;
}
.main-image {
  width: 100%;
  height: 450px;
  border: 1px solid #eee;
  border-radius: 8px;
  overflow: hidden;
  margin-bottom: 15px;
}
.main-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.thumbnail-list {
  display: flex;
  gap: 15px;
}
.thumb-item {
  width: 80px;
  height: 80px;
  border: 2px solid transparent;
  border-radius: 4px;
  cursor: pointer;
  overflow: hidden;
}
.thumb-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.thumb-item.active {
  border-color: #ff6700;
}
</style>