import { createRouter, createWebHistory } from 'vue-router'
import LandingPage from '@/views/LandingPage.vue'
import MallHome from '@/views/MallHome.vue'
import AdminDashboard from '@/views/AdminDashboard.vue'
import ProductDetail from '@/views/ProductDetail.vue'
import PaymentPage from '../views/PaymentPage.vue'
import component from 'element-plus/es/components/tree-select/src/tree-select-option.mjs'
import CartPage from '../views/CartPage.vue'

const routes = [
  {
    path: '/',
    name: 'Landing',
    component: LandingPage
  },
  {
    path: '/mall',
    name: 'MallHome',
    component: MallHome
  },
  {
    path: '/product/:id',
    name: 'ProductDetail',
    component: ProductDetail
  },
  {
    path: '/admin',
    name: 'AdminDashboard',
    component: AdminDashboard
  },
  {
    path: '/payment',
    name: 'Payment',
    component: PaymentPage
  },
  {
    path:'/cart',
    name:'Cart',
    component:CartPage
  },
  {
  path: '/survey',
  name: 'Survey',
  component: () => import('../views/SurveyView.vue')
},
  {
    path:'/products',
    name:'/ProductList',
    component:() => import('@/views/ProductListPage.vue')
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes,
  scrollBehavior(to, from, savedPosition) {
       if (savedPosition) {
      return savedPosition
    }
       return { top: 0 }
  }
})

export default router