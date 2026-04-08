<template>
  <div class="cs-content">
    <div class="cs-faq-list">
      <div class="cs-faq-item" v-for="(faq, index) in faqList" :key="index">
        <div class="cs-faq-question" @click="toggleFaq(index)">
          <span>{{ faq.question }}</span>
          <i class="fas" :class="faq.open ? 'fa-chevron-up' : 'fa-chevron-down'"></i>
        </div>
        <transition name="slide">
          <div class="cs-faq-answer" v-show="faq.open">
            {{ faq.answer }}
          </div>
        </transition>
      </div>
    </div>
    
    <!-- 常见问题搜索 -->
    <div class="cs-faq-search">
      <i class="fas fa-search"></i>
      <input 
        type="text" 
        placeholder="搜索常见问题..."
        v-model="searchKeyword"
        @input="filterFaqs"
      >
    </div>
    
    <!-- 没有搜索结果 -->
    <div class="cs-no-result" v-if="filteredFaqs.length === 0 && searchKeyword">
      没有找到相关问题的解答
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

const props = defineProps({
  faqList: {
    type: Array,
    required: true
  }
})

const searchKeyword = ref('')

// 过滤FAQ
const filteredFaqs = computed(() => {
  if (!searchKeyword.value) return props.faqList
  return props.faqList.filter(faq => 
    faq.question.includes(searchKeyword.value) || 
    faq.answer.includes(searchKeyword.value)
  )
})

const toggleFaq = (index) => {
  props.faqList[index].open = !props.faqList[index].open
}

const filterFaqs = () => {
  // 实际过滤逻辑已经在computed中处理
}
</script>

<style scoped>
.cs-content {
  padding: 20px;
  max-height: 350px;
  overflow-y: auto;
}

.cs-faq-list {
  margin-bottom: 15px;
}

.cs-faq-item {
  border-bottom: 1px solid #f0f0f0;
}

.cs-faq-question {
  padding: 12px 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  cursor: pointer;
  font-size: 13px;
  color: #333;
  transition: color 0.2s;
}

.cs-faq-question:hover {
  color: #ff6700;
}

.cs-faq-question i {
  font-size: 12px;
  color: #999;
  transition: transform 0.2s;
}

.cs-faq-answer {
  padding: 0 0 12px 0;
  font-size: 12px;
  color: #666;
  line-height: 1.6;
}

/* 过渡动画 */
.slide-enter-active,
.slide-leave-active {
  transition: all 0.3s ease;
  max-height: 200px;
  overflow: hidden;
}

.slide-enter-from,
.slide-leave-to {
  max-height: 0;
  opacity: 0;
  padding: 0;
}

/* 搜索框样式 */
.cs-faq-search {
  position: relative;
  margin-top: 15px;
  padding-top: 15px;
  border-top: 1px solid #f0f0f0;
}

.cs-faq-search i {
  position: absolute;
  left: 10px;
  top: 50%;
  transform: translateY(-50%);
  color: #999;
  font-size: 12px;
}

.cs-faq-search input {
  width: 100%;
  padding: 8px 8px 8px 30px;
  border: 1px solid #e0e0e0;
  border-radius: 4px;
  font-size: 12px;
  outline: none;
  transition: border-color 0.2s;
}

.cs-faq-search input:focus {
  border-color: #ff6700;
}

.cs-no-result {
  text-align: center;
  padding: 20px;
  color: #999;
  font-size: 12px;
}
</style>