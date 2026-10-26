<!-- AI问卷调查（侧边栏） -->
<template>
  <div class="survey-container">
    <div class="survey-card">
      <header class="survey-header">
        <h1>宠爱有家AI智能服务用户调研</h1>
        <p> AI迅猛发展，您是否期待在宠爱有家PC端能够有帮您购物的AI小助手？仅需1分钟，让我们一起参与调研，为我们的 AI 功能改进贡献力量！</p>
      </header>

      <form @submit.prevent="handleSubmit" class="survey-form">
        <!-- 9个选择题 -->
        <div v-for="(q, index) in questions" :key="q.id" class="question-item">
          <p class="question-title">
            <span class="q-number">{{ index + 1 }}.</span> {{ q.title }}
          </p>
          <div class="options-group">
            <label v-for="option in q.options" :key="option" class="option-label">
              <input 
                type="radio" 
                :name="'q' + q.id" 
                :value="option" 
                v-model="formData.answers[index]"
                required
              />
              <span class="option-text">{{ option }}</span>
            </label>
          </div>
        </div>

        <!-- 1个自由问答题 -->
        <div class="question-item">
          <p class="question-title">
            <span class="q-number">10.</span> 您对我们的 AI 功能有什么改进建议吗？（选填）
          </p>
          <textarea 
            v-model="formData.feedback" 
            placeholder="请输入您的想法..." 
            class="feedback-textarea"
          ></textarea>
        </div>

        <!-- 提交按钮 -->
        <div class="submit-section">
          <button type="submit" :disabled="submitting" class="submit-btn">
            {{ submitting ? '提交中...' : '提交反馈' }}
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'

const submitting = ref(false)

// 模拟题目数据
const questions = [
  { id: 1, title: '您是否使用过AI电商小助手？', options: ['从未使用', '偶尔使用', '经常使用', '每天使用'] },
  { id: 2, title: '您使用AI电商小助手的主要场景是？', options: ['商品推荐', '客服咨询', '物流查询', '信息查询'] },
  { id: 3, title: '您对目前 AI 推荐商品的准确性满意吗？', options: ['非常满意', '比较满意', '一般', '不满意'] },
  { id: 4, title: '您认为 AI 最能提升您哪方面的效率？', options: ['比价查询', '商品定位', '初稿撰写', '语言翻译'] },
  { id: 5, title: '您更倾向于在哪种终端使用 AI？', options: ['电脑网页版', '手机 App', '微信小程序', '浏览器插件'] },
  { id: 6, title: '您在使用 AI 时最担心的问题是？', options: ['隐私安全', '回答不准', '收费太贵', '操作复杂'] },
  { id: 7, title: '您是否愿意为更高级的 AI 功能付费？', options: ['愿意', '看价格而定', '不愿付费', '已经在付费使用'] },
  { id: 8, title: '您认为 AI 能够完全替代人类的某些工作吗？', options: ['肯定能', '部分能', '很难说', '绝对不能'] },
  { id: 9, title: '您会向身边的朋友推荐我们的 AI 服务吗？', options: ['肯定会', '可能会', '不一定', '不会'] },
]

const formData = reactive({
  answers: new Array(9).fill(''),
  feedback: ''
})

const handleSubmit = () => {
  submitting.value = true
  
  // 模拟 API 请求
  console.log('提交的数据：', JSON.parse(JSON.stringify(formData)))
  
  setTimeout(() => {
    alert('感谢您的参与！您的建议对我们非常重要。')
    submitting.value = false
    // 可以在这里跳转回首页
    // router.push('/')
  }, 1000)
}
</script>

<style scoped>

.survey-container {
  min-height: 100vh;
  background-color: #f8f9fa;
  padding: 40px 20px;
  display: flex;
  justify-content: center;
}

.survey-card {
  max-width: 800px;
  width: 100%;
  background: #ffffff;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
  padding: 40px;
}

.survey-header {
  text-align: center;
  margin-bottom: 40px;
  border-bottom: 1px solid #eee;
  padding-bottom: 20px;
}

.survey-header h1 {
  color: #FF6700;
  font-size: 28px;
  margin-bottom: 10px;
}

.survey-header p {
  color: #888;
  font-size: 14px;
}

.question-item {
  margin-bottom: 30px;
}

.question-title {
  font-size: 16px;
  font-weight: 600;
  color: #000000;
  margin-bottom: 15px;
}

.q-number {
  color: #ff6700;
  margin-right: 8px;
}

.options-group {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 12px;
}

.option-label {
  display: flex;
  align-items: center;
  padding: 10px 15px;
  border: 1px solid #e0e0e0;
  border-radius: 6px;
  cursor: pointer;
  transition: all 0.2s;
}

.option-label:hover {
  background-color: #fff9f5;
  border-color: #ff6700;
}

.option-label input[type="radio"] {
  margin-right: 10px;
  accent-color: #ff6700;
}

.option-text {
  font-size: 14px;
  color: #555;
}

.feedback-textarea {
  width: 100%;
  height: 120px;
  padding: 12px;
  border: 1px solid #e0e0e0;
  border-radius: 6px;
  resize: vertical;
  font-family: inherit;
  font-size: 14px;
  outline: none;
  transition: border-color 0.2s;
}

.feedback-textarea:focus {
  border-color: #ff6700;
}

.submit-section {
  text-align: center;
  margin-top: 40px;
}

.submit-btn {
  background-color: #ff6700;
  color: white;
  border: none;
  padding: 12px 60px;
  font-size: 16px;
  border-radius: 30px;
  cursor: pointer;
  transition: background 0.3s, transform 0.2s;
}

.submit-btn:hover {
  background-color: #e55c00;
}

.submit-btn:active {
  transform: scale(0.98);
}

.submit-btn:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}

/* 移动端适配 */
@media (max-width: 600px) {
  .survey-card {
    padding: 20px;
  }
  .options-group {
    grid-template-columns: 1fr;
  }
}
</style>