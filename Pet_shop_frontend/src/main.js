import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

// --- 新增：引入 Element Plus ---
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
// ----------------------------

const app = createApp(App)

app.use(router)
app.use(ElementPlus) // --- 新增：注册 Element Plus ---

app.mount('#app')