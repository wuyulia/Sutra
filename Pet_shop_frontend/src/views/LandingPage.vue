<!-- 落地页与登录注册页 -->
<template>
  <div class="landing-container">
    <!-- 1. 顶部导航 -->
    <nav>
      <div class="logo"><i class="fas fa-paw"></i> 宠爱有家</div>
      <div class="nav-links">
        <a href="#features">核心功能</a>
        <a href="#">关于我们</a>
        <a href="#">下载APP</a>
        <!-- 将 onclick 改为 @click -->
        <button class="btn btn-outline" @click="showLogin = true">登录 / 注册</button>
      </div>
    </nav>

    <!-- 2. Hero 广告屏 -->
    <header class="hero">
      <div class="hero-content">
        <h1>守护爱宠，从这里开始</h1>
        <p>连接万千宠主与专业服务，打造最温暖的宠物生态社区</p>
        <button class="btn btn-primary" @click="showLogin = true">
          立即体验 <i class="fas fa-arrow-right" style="margin-left: 8px"></i>
        </button>
      </div>
    </header>

    <!-- 3. 核心优势展示 -->
    <section class="features" id="features">
      <!-- 浮动组合：添加 ref 以便在 JS 中获取该元素 -->
      <div class="floating-group" ref="floatingGroupRef">
        <!-- 左侧文字 -->
        <div class="floating-text left-text">
          <h3 class="floating-title">贴心陪伴</h3>
          <p class="floating-description">24小时守护，让爱宠不再孤单</p>
          <div class="floating-decoration"></div>
        </div>

        <!-- 中间图片 -->
        <div class="floating-image-container">
          <img
            src="https://images.unsplash.com/photo-1543466835-00a7907e9de1?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&h=250&q=80"
            alt="可爱宠物"
            class="floating-image"
          />
        </div>

        <!-- 右侧文字 -->
        <div class="floating-text right-text">
          <h3 class="floating-title">专业呵护</h3>
          <p class="floating-description">资深宠医团队，为您提供专业建议</p>
          <div class="floating-decoration"></div>
        </div>
      </div>

      <h2 class="section-title">为什么选择 <span>宠爱有家</span></h2>
      <div class="feature-grid">
        <div class="feature-card">
          <div class="icon-box"><i class="fas fa-shopping-bag"></i></div>
          <h3>严选好物</h3>
          <p>全球精选宠粮、玩具，品牌直供，正品保障，让爱宠吃得放心玩得开心。</p>
        </div>
        <div class="feature-card">
          <div class="icon-box"><i class="fas fa-user-md"></i></div>
          <h3>专业护理</h3>
          <p>在线预约洗护、疫苗、体检。建立电子健康档案，全程记录爱宠成长。</p>
        </div>
        <div class="feature-card">
          <div class="icon-box"><i class="fas fa-home"></i></div>
          <h3>安心寄养</h3>
          <p>24小时监控，恒温环境。像家一样的舒适体验，让您出差旅行无后顾之忧。</p>
        </div>
      </div>
    </section>

    <!-- 4. 登录/注册模态弹窗 -->
    <!-- 使用 Vue 的 v-if 控制显示，并绑定点击遮罩层关闭 -->
    <transition name="fade">
      <div class="modal-overlay active" v-if="showLogin" @click.self="showLogin = false">
        <div class="auth-box">
          <div class="close-btn" @click="showLogin = false">&times;</div>

          <!-- 左侧装饰区：仅给左侧加背景图，右侧保持原样 -->
          <div class="auth-left" style="background-image: url('https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80'); background-size: cover; background-position: center;">
            <div style="position: relative; z-index: 1;">
              <i class="fas fa-cat fa-4x" style="margin-bottom: 20px"></i>
              <h2>欢迎回家</h2>
              <p>登录后即可享受会员专属折扣<br />及在线预约服务</p>
            </div>
          </div>

          <!-- 右侧表单区 -->
          <div class="auth-right">
            <h3 class="form-title">账号登录</h3>
            <form @submit.prevent="handleLogin">
              <div class="input-group">
                <i class="fas fa-user"></i>
                <input
                  type="text"
                  class="form-input"
                  placeholder="请输入手机号/用户名"
                  v-model="username"
                />
              </div>
              <div class="input-group">
                <i class="fas fa-lock"></i>
                <input
                  type="password"
                  class="form-input"
                  placeholder="请输入密码"
                  v-model="password"
                />
              </div>
              <div
                style="
                  display: flex;
                  justify-content: space-between;
                  margin-bottom: 20px;
                  font-size: 12px;
                  color: #666;
                "
              >
                <label><input type="checkbox" /> 记住我</label>
                <a href="#" style="color: #666">忘记密码?</a>
              </div>

              <button type="submit" class="form-btn" :disabled="isLoading">
                <span v-if="isLoading"><i class="fas fa-spinner fa-spin"></i> 登录中...</span>
                <span v-else>立即登录</span>
              </button>

              <p class="switch-text">还没有账号？ <a href="#">免费注册</a></p>
            </form>
          </div>
        </div>
      </div>
    </transition>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'

// --- 状态定义 ---
const router = useRouter()
const showLogin = ref(false) // 控制弹窗显示
const username = ref('admin')
const password = ref('123456')
const isLoading = ref(false)
const floatingGroupRef = ref(null) // 获取 DOM 元素

// --- 登录逻辑 ---
const handleLogin = () => {
  isLoading.value = true

  // 模拟网络请求延迟
  setTimeout(() => {
    isLoading.value = false
    showLogin.value = false // 关闭弹窗

    // 简单的判断逻辑
    if (username.value === 'admin') {
      alert('管理员登录成功！')
      router.push('/admin') // 跳转后台
    } else {
      alert('欢迎回家！跳转商城...')
      router.push('/mall') // 跳转商城
    }
  }, 1000)
}

// --- 滚动动画逻辑 (移植自你的 script.js) ---
let observer = null

onMounted(() => {
  // 当组件挂载完成后，启动观察器
  if (floatingGroupRef.value && window.IntersectionObserver) {
    observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add('visible')
          } else {
            // 如果希望滑出去再滑回来还有动画，保留这一行；否则可以注释掉
            entry.target.classList.remove('visible')
          }
        })
      },
      {
        threshold: 0.2,
      },
    )

    observer.observe(floatingGroupRef.value)
  }
})

onUnmounted(() => {
  // 组件销毁时取消观察，防止内存泄漏
  if (observer) observer.disconnect()
})
</script>

<style scoped>
/* 粘贴你的 CSS 代码，我做了一些小的适配 */

/* --- 全局样式适配 --- */
/* 注意：scoped 样式无法直接作用于 body，所以我们改用 .landing-container */
.landing-container {
  width: 100%;
  overflow-x: hidden;
  background-color: #fff;
  font-family: 'Segoe UI', sans-serif;
}

/* 按钮通用样式 */
.btn {
  padding: 12px 30px;
  border-radius: 50px;
  border: none;
  cursor: pointer;
  font-size: 16px;
  font-weight: bold;
  transition:
    transform 0.2s,
    box-shadow 0.2s;
}
.btn-primary {
  background: #ff6700;
  color: #fff;
  box-shadow: 0 4px 15px rgba(255, 103, 0, 0.4);
}
.btn-primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(255, 103, 0, 0.6);
}

.btn-outline {
  background: transparent;
  border: 2px solid #fff;
  color: #fff;
  margin-left: 15px;
}
.btn-outline:hover {
  background: #fff;
  color: #333;
}

/* --- 1. 顶部透明导航 --- */
nav {
  position: absolute;
  top: 0;
  width: 100%;
  padding: 20px 50px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  z-index: 10;
}

.logo {
  font-size: 24px;
  color: #fff;
  font-weight: bold;
  display: flex;
  align-items: center;
}
.logo i {
  margin-right: 10px;
  font-size: 32px;
  color: #ffbc00;
}

.nav-links a {
  color: #fff;
  text-decoration: none;
  margin-left: 30px;
  font-weight: 500;
  opacity: 0.9;
  transition: opacity 0.3s;
}
.nav-links a:hover {
  opacity: 1;
  text-decoration: underline;
}

/* --- 2. Hero Section --- */
.hero {
  height: 100vh;
  width: 100%;
  background:
    linear-gradient(135deg, rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.3)),
    url('https://images.unsplash.com/photo-1450778869180-41d0601e046e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80');
  background-size: cover;
  background-position: center;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  color: #fff;
  position: relative;
}

.hero-content {
  max-width: 800px;
  animation: fadeInUp 1s ease-out;
}

.hero h1 {
  font-size: 64px;
  margin-bottom: 20px;
  line-height: 1.2;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
}
.hero p {
  font-size: 20px;
  margin-bottom: 40px;
  color: #f0f0f0;
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* --- 3. 特性介绍区 --- */
.features {
  padding: 80px 50px;
  background: #fff;
  text-align: center;
}

/* 浮动动画相关 */
.floating-group {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 40px;
  margin-bottom: 40px;
  padding: 20px;
  opacity: 0;
  transform: translateY(30px);
  transition:
    opacity 2.5s ease,
    transform 2.5s ease;
}

/* Vue 中我们通过 JS 动态添加这个 class */
.floating-group.visible {
  opacity: 1;
  transform: translateY(0);
}

.floating-image-container {
  flex-shrink: 0;
  opacity: 0;
  transform: scale(0.9);
  transition:
    opacity 2.5s ease 0.3s,
    transform 2.5s ease 0.3s;
}

.floating-group.visible .floating-image-container {
  opacity: 1;
  transform: scale(1);
}

.floating-image {
  width: 280px;
  height: 180px;
  border-radius: 12px;
  object-fit: cover;
  box-shadow: 0 15px 30px rgba(255, 103, 0, 0.25);
  border: 3px solid #ff6700;
  animation: floatSlow 4s ease-in-out infinite;
}

.floating-text {
  flex: 1;
  max-width: 250px;
  text-align: left;
  opacity: 0;
  transform: translateX(-30px);
  transition:
    opacity 2s ease,
    transform 2s ease;
}

.floating-group.visible .left-text {
  opacity: 1;
  transform: translateX(0);
}

.floating-group.visible .right-text {
  opacity: 1;
  transform: translateX(0);
  transition-delay: 0.6s;
}

.right-text {
  text-align: right;
  transform: translateX(30px);
}

.floating-title {
  font-size: 28px;
  color: #ff6700;
  margin-bottom: 10px;
  font-weight: bold;
  position: relative;
  display: inline-block;
}

.floating-description {
  font-size: 16px;
  color: #666;
  line-height: 1.6;
  margin-bottom: 15px;
}

.floating-decoration {
  width: 50px;
  height: 3px;
  background: linear-gradient(90deg, #ff6700, transparent);
  margin-top: 10px;
  transition: width 0.5s ease;
}

.right-text .floating-decoration {
  background: linear-gradient(90deg, transparent, #ff6700);
  margin-left: auto;
}

.floating-text:hover .floating-decoration {
  width: 80px;
}
.floating-image:hover {
  transform: scale(1.03);
  transition: transform 0.5s ease;
  box-shadow: 0 20px 40px rgba(255, 103, 0, 0.35);
}

@keyframes floatSlow {
  0% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-12px);
    box-shadow: 0 20px 35px rgba(255, 103, 0, 0.3);
  }
  100% {
    transform: translateY(0px);
  }
}

@media (max-width: 768px) {
  .floating-group {
    flex-direction: column;
    gap: 20px;
  }
  .floating-text {
    text-align: center;
    max-width: 100%;
  }
  .right-text {
    text-align: center;
  }
  .floating-decoration {
    margin: 10px auto 0;
  }
  .right-text .floating-decoration {
    margin: 10px auto 0;
  }
}

.section-title {
  font-size: 32px;
  color: #333;
  margin-bottom: 50px;
  font-weight: bold;
}
.section-title span {
  color: #ff6700;
}
.feature-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 40px;
  max-width: 1200px;
  margin: 0 auto;
}
.feature-card {
  padding: 40px 20px;
  border-radius: 12px;
  background: #f9f9f9;
  transition: 0.3s;
}
.feature-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}
.icon-box {
  width: 80px;
  height: 80px;
  background: #fff3e0;
  color: #ff6700;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 32px;
  margin: 0 auto 20px;
}
.feature-card h3 {
  margin-bottom: 15px;
  color: #333;
}
.feature-card p {
  color: #666;
  line-height: 1.6;
}

/* --- 4. 模态框 (Vue 适配版) --- */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.6);
  backdrop-filter: blur(5px);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
}

/* Vue transition 动画类名 */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.auth-box {
  background: #ffffff;
  width: 900px;
  height: 550px;
  border-radius: 20px;
  display: flex;
  overflow: hidden;
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
  position: relative;
  /* 移除 scale 动画，交给 transition 处理，或者保留 transform */
}

.close-btn {
  position: absolute;
  top: 20px;
  right: 20px;
  font-size: 24px;
  cursor: pointer;
  color: #999;
  z-index: 10;
}
.close-btn:hover {
  color: #333;
}
.auth-left {
  flex: 1;
  background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: #fff;
  padding: 40px;
  text-align: center;
}
.auth-left h2 {
  font-size: 32px;
  margin-bottom: 10px;
  color: #FF6700;
}
.auth-left p {
  opacity: 0.9;
  color: #FF6700;
}
.auth-right {
  flex: 1;
  padding: 50px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.form-title {
  font-size: 28px;
  color: #333;
  margin-bottom: 30px;
  font-weight: bold;
}
.input-group {
  margin-bottom: 20px;
  position: relative;
}
.input-group i {
  position: absolute;
  left: 15px;
  top: 15px;
  color: #ccc;
}
.form-input {
  width: 100%;
  padding: 12px 12px 12px 45px;
  border: 1px solid #ddd;
  border-radius: 8px;
  font-size: 14px;
  outline: none;
  transition: border-color 0.3s;
}
.form-input:focus {
  border-color: #ff6700;
}
.form-btn {
  width: 100%;
  padding: 14px;
  background: #ff6700;
  color: #fff;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  cursor: pointer;
  margin-top: 10px;
  font-weight: bold;
}
.form-btn:hover {
  background: #e65c00;
}
.form-btn:disabled {
  background: #ffb07c;
  cursor: not-allowed;
}
.switch-text {
  margin-top: 20px;
  text-align: center;
  font-size: 14px;
  color: #666;
}
.switch-text a {
  color: #ff6700;
  cursor: pointer;
  text-decoration: none;
}
</style>
