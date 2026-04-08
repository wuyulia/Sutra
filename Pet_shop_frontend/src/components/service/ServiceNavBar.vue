<template>
  <div class="service-nav-bar">
    <div class="nav-item" v-for="cat in serviceCategories" :key="cat.id">
      <div class="icon-box" :style="{ backgroundColor: cat.bgColor }">
        <i :class="['fas', cat.icon]"></i>
      </div>
      <span class="nav-title">{{ cat.title }}</span>

      <!-- 悬停弹出的二级菜单框 -->
      <div class="sub-menu-dropdown">
        <div class="sub-menu-content">
          <h4>{{ cat.title }}服务项目</h4>
          <ul>
            <li v-for="(sub, idx) in cat.children" :key="idx">
              <span class="sub-name">{{ sub.name }}</span>
              <span class="sub-desc">{{ sub.desc }}</span>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  serviceCategories: {
    type: Array,
    required: true
  }
})
</script>

<style scoped>
.service-nav-bar {
  display: flex;
  justify-content: space-around;
  background: linear-gradient(to bottom, #fff5f0 0%, #ffffff 100%);
  padding: 12px 0;
  border-radius: 12px;
  margin-bottom: 25px;
  box-shadow: 0 4px 15px rgba(255, 103, 0, 0.05);
  border: 1px solid #ffefe5;
}

.nav-item {
  position: relative; 
  display: flex;
  flex-direction: column;
  align-items: center;
  cursor: pointer;
  padding: 5px 10px;
}

.icon-box {
  width: 38px;
  height: 38px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 18px;
  margin-bottom: 5px;
  transition: transform 0.3s;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}
.nav-item:hover .icon-box {
  transform: scale(1.1);
}

.nav-title {
  font-size: 12px;
  color: #333;
  font-weight: bold;
}

.sub-menu-dropdown {
  position: absolute;
  top: 100%;
  left: 50%;
  transform: translateX(-50%) translateY(10px);
  width: 260px;
  opacity: 0;
  visibility: hidden;
  transition: all 0.3s ease;
  z-index: 100;
  padding-top: 15px; 
}

.nav-item:hover .sub-menu-dropdown {
  opacity: 1;
  visibility: visible;
  transform: translateX(-50%) translateY(0);
}

.sub-menu-content {
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.15);
  padding: 15px;
  border: 1px solid #f0f0f0;
}

.sub-menu-content h4 {
  margin: 0 0 10px 0;
  padding-bottom: 8px;
  border-bottom: 1px dashed #ddd;
  font-size: 14px;
  color: #ff6700;
  text-align: center;
}

.sub-menu-content ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.sub-menu-content li {
  padding: 8px 5px;
  border-radius: 6px;
  transition: background 0.2s;
  display: flex;
  flex-direction: column;
}

.sub-menu-content li:hover {
  background: #fff5f0;
}

.sub-name {
  font-size: 14px;
  color: #333;
  font-weight: bold;
  margin-bottom: 3px;
}

.sub-desc {
  font-size: 12px;
  color: #888;
}
</style>