<template>
  <div>
    <!-- 顶部黑条 (保持不变) -->
    <div class="top-bar">
      <div class="container">
        <div class="left-nav">
          <a href="#">首页</a><span style="margin:0 5px">|</span>
          <a href="#">关于我们</a><span style="margin:0 5px">|</span>
          <a href="#">APP下载</a>
        </div>
        <div class="right-nav">
          <a href="#"><i class="fas fa-shopping-cart"></i> 购物车 (0)</a>
          <span style="margin:0 10px"></span>
          <a href="#">我的订单</a>
        </div>
      </div>
    </div>

    <!-- 头部：Logo + 搜索 + 登录/注册 -->
    <header class="site-header">
      <div class="container header-content">
        <a href="#" class="logo">
          <i class="fas fa-paw"></i> 宠爱有家
        </a>
        
        <!-- 搜索区域容器 -->
        <div class="search-wrapper">
          <div class="search-box">
            <div class="input-group">
              <input type="text" class="search-input" placeholder="搜索宠物零食、玩具、服务..." v-model="searchKeyword" @keyup.enter="handleSearch">
              <!-- 新增：相机图标 -->
              <i class="fas fa-camera camera-icon" title="点击上传图片搜索"></i>
            </div>
            <button class="search-btn" @click="handleSearch"><i class="fas fa-search"></i></button>
          </div>

        
          <!-- 新增：搜索栏下方的导航词（热搜词） -->
          <div class="hot-words">
            <a href="#">进口猫粮</a>
            <a href="#">自动喂食器</a>
            <a href="#">宠物洗澡</a>
            <a href="#">防叮咬项圈</a>
            <a href="#">智能猫砂盆</a>
          </div>
        </div>

        <div class="user-actions">
          <a href="javascript:void(0)" class="btn-login" @click="goLogin">登录 / 切换账号</a>
          <a href="#" class="btn-register">免费注册</a>
        </div>
      </div>
    </header>
  </div>
</template>

<script setup>
// 1. 新增引入 ref (非常重要，不写这个 searchKeyword 会报错)
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

// ==========================================
// 原有的逻辑：跳转到登录页
// ==========================================
const goLogin = () => {
  router.push('/')
}

// ==========================================
// 新增的逻辑：搜索功能
// ==========================================
// 2. 定义绑定的搜索词变量
const searchKeyword = ref('')

// 3. 定义点击搜索按钮执行的函数
const handleSearch = () => {
  // 如果没输入东西，就不跳转
  if (!searchKeyword.value.trim()) {
    alert('请输入你要搜索的商品！')
    return
  }
  
  // 带着参数跳转到你的商品列表页
  router.push({
    path: '/products',
    query: { keyword: searchKeyword.value }
  })
}
</script>

<style scoped>
/* --- 原有样式保持不变 --- */
.top-bar { background-color: #333; color: #b0b0b0; height: 30px; line-height: 30px; font-size: 12px; }
.top-bar .container { display: flex; justify-content: space-between; }
.top-bar a:hover { color: #fff; }

.site-header { background-color: #fff; height: 110px; display: flex; align-items: center; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
.header-content { display: flex; align-items: center; justify-content: space-between; width: 100%; }
.logo { font-size: 28px; font-weight: bold; color: #ff6700; display: flex; align-items: center; }
.logo i { margin-right: 10px; font-size: 36px; }

/* --- 搜索区域修改与新增样式 --- */
.search-wrapper {
  display: flex;
  flex-direction: column; /* 让热搜词排在搜索框下方 */
  gap: 8px;
}

.search-box { 
  display: flex; 
  width: 500px; 
}

.input-group {
  position: relative; /* 为相机图标定位 */
  flex: 1;
  display: flex;
}

.search-input { 
  width: 100%;
  height: 40px; 
  border: 2px solid #ff6700; 
  border-right: none; 
  padding: 0 40px 0 10px; /* 右侧留出空间给相机图标 */
  outline: none; 
}

/* 相机图标样式 */
.camera-icon {
  position: absolute;
  right: 10px;
  top: 50%;
  transform: translateY(-50%);
  color: #999999bd;
  cursor: pointer;
  font-size: 18px;
  transition: color 0.2s;
}

.camera-icon:hover {
  color: #ff6700;
}

.search-btn { 
  width: 65px; 
  height: 40px; 
  background-color: #ff6700; 
  border: none; 
  color: #fff; 
  cursor: pointer; 
  font-size: 16px; 
  margin-top: 0px; /* 修正边框对齐问题 */
}

/* 热搜词样式 */
.hot-words {
  display: flex;
  gap: 15px;
  padding-left: 2px;
}

.hot-words a {
  font-size: 12px;
  color: #888;
}

.hot-words a:hover {
  color: #ff6700;
}

/* --- 按钮样式保持不变 --- */
.user-actions { display: flex; gap: 20px; align-items: center; }
.btn-login { color: #ff6700; border: 1px solid #ff6700; padding: 5px 15px; border-radius: 4px; }
.btn-register { background-color: #ff6700; color: #fff; padding: 6px 16px; border-radius: 4px; }

.container { width: 1400px; margin: 0 auto; }
a { text-decoration: none; color: inherit; transition: color 0.3s; }
</style>