<template>
  <div class="review-list">
    <div v-for="i in 10" :key="i" class="review-item">
      <div class="review-user">
        <img src="https://api.dicebear.com/7.x/avataaars/svg?seed=Lucky" class="avatar">
        <span class="username">用户_{{i}}***k</span>
        <span class="stars">⭐⭐⭐⭐⭐</span>
      </div>
      <div class="review-content">
        我家毛孩子非常喜欢这个！质量很好，物流也快。
      </div>
      <div class="review-imgs">
        <img v-for="j in 3" :key="j" src="https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?auto=format&fit=crop&w=100&q=80" alt="晒图">
      </div>
      <div class="review-date">2023-10-24 14:20</div>
    </div>
  </div>
</template>

<style scoped>
.review-item { padding: 15px 0; border-bottom: 1px solid #eee; }
.review-user { display: flex; align-items: center; gap: 10px; margin-bottom: 8px; }
.avatar { width: 30px; height: 30px; border-radius: 50%; background: #eee; }
.username { font-size: 13px; color: #666; }
.stars { color: #ff6700; font-size: 12px; }
.review-content { font-size: 14px; line-height: 1.6; color: #333; margin-bottom: 10px; }
.review-imgs { display: flex; gap: 8px; margin-bottom: 8px; }
.review-imgs img { width: 60px; height: 60px; border-radius: 4px; object-fit: cover; border: 1px solid #eee; }
.review-date { font-size: 12px; color: #999; }
</style>