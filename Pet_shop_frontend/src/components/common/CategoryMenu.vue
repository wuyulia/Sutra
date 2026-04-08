<template>
  <div class="category-wrapper" @mouseleave="hideSubMenu">
    <ul class="sidebar-menu">
      <li 
        v-for="cat in categories" 
        :key="cat.id"
        @mouseenter="showSubMenu(cat.id)"
        :class="{ 'active': activeCategoryId === cat.id }"
      >
        <div class="menu-item-left">
          <i :class="['fas', cat.icon]" class="menu-icon"></i>
          <span>{{ cat.name }}</span>
        </div>
        <i class="fas fa-chevron-right arrow"></i>
      </li>
    </ul>

    <!-- 右侧弹出的巨型菜单 -->
    <div class="mega-menu" v-show="activeCategoryId !== null">
      <div class="mega-menu-content" v-if="currentCategory">
        <div class="sub-group" v-for="(sub, index) in currentCategory.subCategories" :key="index">
          <div class="sub-title">
            {{ sub.title }} <i class="fas fa-angle-right"></i>
          </div>
          <div class="sub-items">
            <!-- 核心修改：使用 span 绑定点击事件，并传入对应的 cat.id 和 item.id -->
            <span 
              class="brand-link" 
              v-for="(item, idx) in sub.items" 
              :key="idx"
              @click="handleFilter(currentCategory.id, item.id)"
            >
              {{ item.name }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'

const props = defineProps({
  categories: {
    type: Array,
    required: true
  }
})

const router = useRouter()
const activeCategoryId = ref(null)

const currentCategory = computed(() => {
  return props.categories.find(c => c.id === activeCategoryId.value)
})

const showSubMenu = (id) => {
  activeCategoryId.value = id
}

const hideSubMenu = () => {
  activeCategoryId.value = null
}

// 跳转逻辑
const handleFilter = (catId, brandId) => {
  // 如果没有 id，说明是占位符，不做处理
  if (!brandId) return 
  
  router.push({
    path: '/product-list', // 这里确保是你的商品列表页路由
    query: {
      categoryId: catId,
      brandId: brandId
    }
  })
  hideSubMenu()
}
</script>

<style scoped>
.category-wrapper {
  position: relative;
  width: 234px;
  height: 100%;
  z-index: 100;
}

.sidebar-menu {
  list-style: none;
  background-color: #555555;
  margin: 0;
  padding: 10px 0;
  height: 100%;
  color: white;
  box-shadow: 2px 0 5px rgba(0,0,0,0.1);
}

.sidebar-menu li {
  padding: 0 20px;
  height: 55px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  cursor: pointer;
  transition: background-color 0.2s;
}

.sidebar-menu li:hover,
.sidebar-menu li.active {
  background-color: #ff6600ba;
}

.menu-item-left {
  display: flex;
  align-items: center;
}
.menu-icon {
  width: 24px;
  margin-right: 15px;
  text-align: center;
  font-size: 18px;
}
.arrow {
  font-size: 12px;
}

.mega-menu {
  position: absolute;
  top: 0;
  left: 234px;
  width: 900px;
  height: 110%;
  background-color: #ffffff;
  border: 2px solid #FF6700;
  border-radius: 8px;
  padding: 20px;
  box-sizing: border-box;
  overflow-y: auto;
}

.sub-group {
  display: flex;
  align-items: flex-start;
  border-bottom: 1px solid #eee;
  padding-bottom: 15px;
  margin-bottom: 15px;
}
.sub-title {
  width: 100px;
  font-weight: bold;
  color: #333;
  padding-right: 20px;
  flex-shrink: 0;
}
.sub-items {
  flex: 1;
  display: flex;
  flex-wrap: wrap;
  gap: 15px;
}
/* 品牌链接样式 */
.brand-link {
  color: #666;
  font-size: 14px;
  cursor: pointer;
  padding: 0 5px;
  border-left: 1px solid #ddd;
}
.brand-link:first-child { border-left: none; }
.brand-link:hover { color: #ff6700; }
</style>