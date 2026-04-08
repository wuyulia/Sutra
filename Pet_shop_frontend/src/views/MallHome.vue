<!-- 商城首页 -->
<template>
  <div class="mall-wrapper">
    <!-- 1. 头部组件 -->
    <HeaderBar />

    <!-- 2. 核心区域：侧边分类菜单 + 轮播图 -->
    <div class="container hero-section">
      <div class="hero-wrapper">
        <!-- 左侧分类菜单组件 -->
        <CategoryMenu :categories="categories" />

        <!-- 轮播图 -->
        <div class="slider">
          <div class="slide-img"></div>
        </div>
      </div>
    </div>

    <!-- 3. 服务流程入口组件 -->
    <div class="container">
      <ServicesBar :topServices="topServices" />
    </div>

    <!-- 4. 商品展示区 -->
    <div class="container">
      <!-- 热门商品 -->
      <h3 class="section-title">
        热卖单品
        <span>查看更多 <i class="fas fa-angle-right"></i></span>
      </h3>
      <div class="goods-grid">
        <!-- 使用商品卡片组件 -->
        <ProductCard v-for="item in hotGoods" :key="item.id" :product="item" />
      </div>

      <!-- 预约服务展示 -->
      <h3 class="section-title">
        精选服务
        <span>在线预约 <i class="fas fa-angle-right"></i></span>
      </h3>

      <!-- 服务金刚区导航组件 -->
      <ServiceNavBar :serviceCategories="serviceCategories" />

    </div>

    <!-- 5. 右侧悬浮侧边栏组件 -->
    <RightFixedBar />

    <!-- 6. 页脚组件 -->
    <FooterBar :footerSlogans="footerSlogans" :footerLinks="footerLinks" />
  </div>
</template>

<script setup>
import { ref } from 'vue'

// 增加路由跳转逻辑
import { useRouter } from 'vue-router' // 引入路由钩子

// 1. 初始化路由对象
const router = useRouter()

// 2. 绑定搜索框的值
const searchKeyword = ref('') // 可以默认空字符串 ''

// 3. 搜索按钮点击事件
const handleSearch = () => {
  // 如果输入框是空的，就不跳转
  if (!searchKeyword.value.trim()) {
    alert('请输入搜索内容！')
    return
  }

  // 核心跳转逻辑：带着 keyword 参数跳到 /products 页面
  router.push({
    path: '/products',
    query: { keyword: searchKeyword.value },
  })
}

import {
  HeaderBar,
  CategoryMenu,
  ProductCard,
  ServiceNavBar,
  FooterBar,
  ServicesBar,
  RightFixedBar,
} from '@/components'

// --- 所有数据保持不变 ---
const categories = ref([
  {
    id: 1, // 狗狗主粮分类ID
    name: '狗狗商城',
    icon: 'fa-dog',
    subCategories: [
      {
        title: '进口狗粮',
        items: [
          { name: '渴望', id: 2 },
          { name: '爱肯拿', id: 5 },
          { name: '百利', id: 11 },
          { name: '纽翠斯', id: 12 },
          { name: '卡比', id: 13 },
          { name: '海洋之星', id: 14 },
          { name: '皇家', id: 1 },
          { name: '比利玛格', id: 15 },
          { name: '蓝挚', id: 16 },
        ],
      },
      {
        title: '国产狗粮',
        items: [
          { name: '伯纳天纯', id: 4 },
          { name: '麦富迪', id: 3 },
          { name: '疯狂小狗', id: 17 },
          { name: '网易严选', id: 18 },
          { name: '比瑞吉', id: 19 },
          { name: '鲜朗', id: 20 },
        ],
      },
      // ... 下面这些按需设置 ID (如果暂时不具备筛选功能，可以给 id: 0)
      {
        title: '处方粮',
        items: [
          { name: '肠道处方粮', id: 0 },
          { name: '泌尿处方粮', id: 0 },
          { name: '胃肠道粮', id: 0 },
          { name: '关节护理粮', id: 0 },
          { name: '水解蛋白型', id: 0 },
          { name: '其他', id: 0 },
        ],
      },
      {
        title: '产地',
        items: [
          { name: '加拿大', id: 0 },
          { name: '美国', id: 0 },
          { name: '德国', id: 0 },
          { name: '新西兰', id: 0 },
          { name: '巴西', id: 0 },
          { name: '澳大利亚', id: 0 },
          { name: '瑞士', id: 0 },
          { name: '其他', id: 0 },
        ],
      },
      {
        title: '年龄',
        items: [
          { name: '幼犬', id: 0 },
          { name: '成犬', id: 0 },
          { name: '全犬', id: 0 },
          { name: '小型犬', id: 0 },
          { name: '中型犬', id: 0 },
          { name: '大型犬', id: 0 },
        ],
      },
      {
        title: '品种',
        items: [
          { name: '边牧', id: 0 },
          { name: '金毛', id: 0 },
          { name: '泰迪', id: 0 },
          { name: '哈士奇', id: 0 },
          { name: '柴犬', id: 0 },
          { name: '茶杯犬', id: 0 },
          { name: '拉布拉多', id: 0 },
          { name: '德牧', id: 0 },
          { name: '萨摩耶', id: 0 },
          { name: '杜宾犬', id: 0 },
          { name: '其他', id: 0 },
        ],
      },
    ],
  },

  {
    id: 2, // 猫咪主粮分类ID
    name: '猫咪商城',
    icon: 'fa-cat',
    subCategories: [
      {
        title: '进口猫粮',
        items: [
          { name: '渴望', id: 2 },
          { name: '爱肯拿', id: 5 },
          { name: '法米娜', id: 21 },
          { name: '纽翠斯', id: 12 },
          { name: '百利', id: 11 },
          { name: '卡比', id: 13 },
        ],
      },
      {
        title: '国产猫粮',
        items: [
          { name: '高爷家', id: 22 },
          { name: '网易严选', id: 18 },
          { name: '诚实一口', id: 23 },
          { name: '阿飞和巴弟', id: 24 },
          { name: '网易天成', id: 25 },
          { name: '比乐', id: 26 },
          { name: '冠能', id: 8 },
          { name: '金商', id: 27 },
        ],
      },
      {
        title: '猫罐头/湿粮',
        items: [
          { name: '巅峰主食罐', id: 28 },
          { name: 'K9主食罐', id: 29 },
          { name: '小李子', id: 30 },
          { name: '交响乐', id: 31 },
        ],
      },
      {
        title: '清洁美容',
        items: [
          { name: '专用沐浴露', id: 0 },
          { name: '梳子', id: 0 },
          { name: '指甲剪', id: 0 },
          { name: '洗耳液', id: 0 },
          { name: '烘干袋', id: 0 },
          { name: '宠物湿巾', id: 0 },
        ],
      },
      {
        title: '出行用品',
        items: [
          { name: '猫包', id: 0 },
          { name: '牵引绳', id: 0 },
          { name: '胸背带', id: 0 },
          { name: '尿垫', id: 0 },
          { name: '便携水壶', id: 0 },
        ],
      },
      {
        title: '年龄',
        items: [
          { name: '成猫', id: 0 },
          { name: '幼猫', id: 0 },
          { name: '全猫', id: 0 },
          { name: '老龄猫', id: 0 },
        ],
      },
      {
        title: '产地',
        items: [
          { name: '加拿大', id: 0 },
          { name: '美国', id: 0 },
          { name: '德国', id: 0 },
          { name: '新西兰', id: 0 },
          { name: '巴西', id: 0 },
          { name: '澳大利亚', id: 0 },
          { name: '瑞士', id: 0 },
        ],
      },
      {
        title: '品种',
        items: [
          { name: '英短', id: 0 },
          { name: '美短', id: 0 },
          { name: '金渐层', id: 0 },
          { name: '加菲猫', id: 0 },
          { name: '布偶猫', id: 0 },
          { name: '蓝猫', id: 0 },
          { name: '银渐层', id: 0 },
          { name: '田园猫', id: 0 },
          { name: '缅因猫', id: 0 },
          { name: '波斯猫', id: 0 },
          { name: '挪威森林猫', id: 0 },
        ],
      },
    ],
  },
  {
    id: 3,
    name: '爬宠/鱼类',
    icon: 'fa-cookie-bite',
    subCategories: [
      {
        title: '狗狗零食',
        items: [
          { name: '磨牙棒', id: 0 },
          { name: '肉干', id: 0 },
          { name: '火腿肠', id: 0 },
          { name: '洁齿骨', id: 0 },
          { name: '狗罐头', id: 0 },
          { name: '奶酪块', id: 0 },
          { name: '冻干多春鱼', id: 0 },
          { name: '宠物香肠', id: 0 },
        ],
      },

      {
        title: '饲养容器',
        items: [
          { name: '亚克力缸', id: 0 },
          { name: 'PVC箱', id: 0 },
          { name: '整理箱', id: 0 },
          { name: '雨林缸', id: 0 },
          { name: '透气盒子', id: 0 },
          { name: '带锁盖子', id: 0 },
          { name: '无盖缸', id: 0 },
        ],
      },
      {
        title: '温光控设备',
        items: [
          { name: '加热垫', id: 0 },
          { name: '陶瓷加热灯', id: 0 },
          { name: 'UVB灯', id: 0 },
          { name: '温湿度计', id: 0 },
          { name: '温控器', id: 0 },
          { name: '定时器', id: 0 },
          { name: '数字控制器', id: 0 },
          { name: '换氧泵', id: 0 },
          { name: '过滤器', id: 0 },
        ],
      },
      {
        title: '环境垫材',
        items: [
          { name: '垫材', id: 0 },
          { name: '洞穴', id: 0 },
          { name: '躲避屋', id: 0 },
          { name: '水盆', id: 0 },
          { name: '进食盆', id: 0 },
          { name: '加湿器', id: 0 },
          { name: '栖木', id: 0 },
          { name: '造景石', id: 0 },
          { name: '仿真植物', id: 0 },
          { name: '水草', id: 0 },
        ],
      },
      {
        title: '清洁工具',
        items: [
          { name: '喂食钳', id: 0 },
          { name: '电子秤', id: 0 },
          { name: '消毒液', id: 0 },
          { name: '吸虫器', id: 0 },
          { name: '小铲子', id: 0 },
          { name: '长镊子', id: 0 },
        ],
      },
      {
        title: '营养补充',
        items: [
          { name: '活体饲料', id: 0 },
          { name: '冻干饲料', id: 0 },
          { name: '钙粉', id: 0 },
          { name: '维生素粉', id: 0 },
          { name: '蟋蟀', id: 0 },
          { name: '面包虫', id: 0 },
          { name: '大麦虫', id: 0 },
          { name: '乳鼠', id: 0 },
        ],
      },
      {
        title: '种类',
        items: [
          { name: '巴西龟', id: 0 },
          { name: '草龟', id: 0 },
          { name: '闭壳龟', id: 0 },
          { name: '豹纹守宫', id: 0 },
          { name: '绿鬃蜥', id: 0 },
          { name: '玉米蛇', id: 0 },
          { name: '狼蛛', id: 0 },
          { name: '仓鼠', id: 0 },
          { name: '球蟒', id: 0 },
          { name: '安乐蜥', id: 0 },
          { name: '王蛇', id: 0 },
        ],
      },
      {
        title: '鱼类',
        items: [
          { name: '王蛇', id: 0 },
          { name: '孔雀鱼', id: 0 },
          { name: '斑马鱼', id: 0 },
          { name: '玛丽鱼', id: 0 },
          { name: '金鱼', id: 0 },
          { name: '锦鲤', id: 0 },
          { name: '珍珠马甲', id: 0 },
          { name: '龙鱼', id: 0 },
          { name: '罗汉鱼', id: 0 },
          { name: '红鼻剪刀', id: 0 },
          { name: '白云金丝', id: 0 },
          { name: '鹦鹉鱼', id: 0 },
        ],
      },
    ],
  },
  {
    id: 4,
    name: '宠物零食',
    icon: 'fa-cookie-bite',
    subCategories: [
      {
        title: '狗狗零食',
        items: [
          { name: '磨牙棒', id: 0 },
          { name: '冻干香肠', id: 0 },
          { name: '洁齿骨', id: 0 },
          { name: '狗罐头', id: 0 },
          { name: '奶酪块', id: 0 },
          { name: '冻干多春鱼', id: 0 },
          { name: '宠物香肠', id: 0 },
        ],
      },
      {
        title: '猫咪零食',
        items: [
          { name: '猫条', id: 0 },
          { name: '冻干肉', id: 0 },
          { name: '猫薄荷', id: 0 },
          { name: '猫草', id: 0 },
          { name: '猫罐头', id: 0 },
          { name: '肉泥', id: 0 },
          { name: '小鱼干', id: 0 },
          { name: '蛋黄', id: 0 },
        ],
      },
      {
        title: '爬虫零食',
        items: [
          { name: '冻干ickets', id: 0 },
          { name: '杜蟑螂', id: 0 },
          { name: '冻干面包虫', id: 0 },
        ],
      },
      {
        title: '鱼类',
        items: [
          { name: '冻干丰年虾', id: 0 },
          { name: '红虫干', id: 0 },
          { name: '专用薄片', id: 0 },
          { name: '颗粒零食', id: 0 },
        ],
      },
    ],
  },
  {
    id: 5,
    name: '玩具用品',
    icon: 'fa-baseball-ball',
    subCategories: [
      {
        title: '出行装备',
        items: [
          { name: '牵引绳', id: 0 },
          { name: '航空箱', id: 0 },
          { name: '宠物推车', id: 0 },
          { name: '随行杯', id: 0 },
        ],
      },
      {
        title: '日常用品',
        items: [
          { name: '猫砂', id: 0 },
          { name: '猫砂盆', id: 0 },
          { name: '拾便袋', id: 0 },
          { name: '宠物尿垫', id: 0 },
          { name: '除臭剂', id: 0 },
          { name: '护毛素', id: 0 },
          { name: '吸尘器', id: 0 },
          { name: '鱼缸', id: 0 },
          { name: '氧气泵', id: 0 },
        ],
      },
      {
        title: '互动玩具',
        items: [
          { name: '逗猫棒', id: 0 },
          { name: '漏食球', id: 0 },
          { name: '猫爬架', id: 0 },
          { name: '洁齿棒', id: 0 },
          { name: '磨牙棒', id: 0 },
          { name: '牛膝骨', id: 0 },
          { name: '响纸玩具', id: 0 },
        ],
      },
    ],
  },
  {
    id: 6,
    name: '医疗保健',
    icon: 'fa-clinic-medical',
    subCategories: [
      {
        title: '体内外驱虫',
        items: [
          { name: '大宠爱', id: 0 },
          { name: '福来恩', id: 0 },
          { name: '海乐妙', id: 0 },
          { name: '拜宠清', id: 0 },
        ],
      },
      {
        title: '营养保健',
        items: [
          { name: '化毛膏', id: 0 },
          { name: '微量元素', id: 0 },
          { name: '鱼油', id: 0 },
          { name: '益生菌', id: 0 },
        ],
      },
      {
        title: '疫苗',
        items: [
          { name: '狂犬病疫苗', id: 0 },
          { name: '小犬疫苗', id: 0 },
          { name: '中犬疫苗', id: 0 },
          { name: '大犬疫苗', id: 0 },
          { name: '犬瘟', id: 0 },
          { name: '细小', id: 0 },
          { name: '腹泻', id: 0 },
          { name: '耳螨', id: 0 },
        ],
      },
      {
        title: '常备药',
        items: [
          { name: '益生菌', id: 0 },
          { name: '洗耳液', id: 0 },
          { name: '体外驱虫滴液', id: 0 },
          { name: '透气盒子', id: 0 },
        ],
      },
    ],
  },
  {
    id: 7,
    name: '寄养预约',
    icon: 'fa-home',
    subCategories: [
      {
        title: '服务',
        items: [
          { name: '短期寄养', id: 0 },
          { name: '长期寄养', id: 0 },
        ],
      },
    ],
  },
  {
    id: 8,
    name: '洗护美容',
    icon: 'fa-shower',
    subCategories: [
      {
        title: '服务',
        items: [
          { name: '洗澡去死皮', id: 0 },
          { name: '全身造型', id: 0 },
          { name: '剪指甲', id: 0 },
          { name: '干洗粉', id: 0 },
          { name: '宠物牙膏', id: 0 },
          { name: '洗眼液', id: 0 },
        ],
      },
      {
        title: '养毛护肤',
        items: [
          { name: '护毛喷雾', id: 0 },
          { name: '毛发精油', id: 0 },
          { name: '护毛膏', id: 0 },
          { name: '护爪膏', id: 0 },
          { name: '皮肤修复膏', id: 0 },
          { name: '除臭喷雾', id: 0 },
        ],
      },
      {
        title: '洗澡工具',
        items: [
          { name: '洗澡盆', id: 0 },
          { name: '吸水毛巾', id: 0 },
          { name: '烘干箱', id: 0 },
          { name: '洗猫袋', id: 0 },
        ],
      },
    ],
  },
])

const topServices = ref([
  { icon: 'fa-home', title: '宠物寄养', desc: '24小时监控 环境舒适' },
  { icon: 'fa-stethoscope', title: '健康档案', desc: '建立专属电子病历' },
  { icon: 'fa-cut', title: '美容洗护', desc: '专业造型 预约服务' },
  { icon: 'fa-shield-alt', title: '正品保障', desc: '品牌授权 假一赔十' },
])

const hotGoods = ref([
  { id: 1, title: '皇家(Royal Canin) 小型犬成犬粮 2kg 呵护毛发', price: '128.00', sales: '200+' },
  { id: 2, title: '全价冻干双拼猫粮 增肥发腮 幼猫成猫通用', price: '89.90', sales: '500+' },
  { id: 3, title: '宠物自动饮水机 智能感应 循环过滤不漏电', price: '159.00', sales: '120+' },
  { id: 4, title: '耐咬磨牙骨 狗狗玩具 洁齿除口臭', price: '19.90', sales: '1000+' },
  { id: 5, title: '贵为(GiGwi) 发声棉绳结玩具 宠物狗磨牙洁齿', price: '29.90', sales: '1500+' },
  { id: 6, title: '宜特(lpet) 漏食球不倒翁 狗狗益智训练', price: '49.90', sales: '800+' },
  { id: 7, title: '伯纳天纯(CHNPP) 无谷生鲜系列 10kg 冻干肉粒', price: '458.00', sales: '250+' },
  { id: 8, title: '海洋之星(Fish4Dogs) 深海鱼成犬粮 6kg 美毛护肤', price: '329.00', sales: '180+' },
  { id: 9, title: '麦富迪(Myfoodie) 牛肉双拼粮 20kg 全犬种', price: '269.00', sales: '2000+' },
  {
    id: 10,
    title: '纽顿(Now Fresh) 无谷去泪痕配方 2.72kg 小型犬成犬',
    price: '199.00',
    sales: '350+',
  },
  { id: 11, title: '凯锐思(KERES) 全价成犬粮 8kg 高蛋白低脂', price: '139.00', sales: '800+' },
  { id: 12, title: 'Chewy狗狗食盆+水盆（不洒不漏）', price: '39.90', sales: '1500+' },
])

const featuredServices = ref([
  {
    id: 1,
    icon: 'fa-shower',
    bgColor: '#e6f7ff',
    iconColor: '#1890ff',
    title: '【洗护】精致洗澡+全身修剪套餐（小型犬）',
    price: '¥ 168.00',
  },
  {
    id: 2,
    icon: 'fa-hotel',
    bgColor: '#fff7e6',
    iconColor: '#fa8c16',
    title: '【寄养】豪华猫咪公寓 24h空调 包含喂食',
    price: '¥ 80.00 / 天',
  },
  {
    id: 3,
    icon: 'fa-syringe',
    bgColor: '#f6ffed',
    iconColor: '#52c41a',
    title: '【医疗】年度疫苗套餐 狂犬+联苗',
    price: '¥ 280.00',
  },
  {
    id: 4,
    icon: 'fa-camera',
    bgColor: '#fff0f6',
    iconColor: '#eb2f96',
    title: '【摄影】宠物写真套餐 包含精修底片',
    price: '¥ 599.00',
  },
])

const footerSlogans = ref([
  { icon: '多', title: '百种萌宠，用品齐全' },
  { icon: '快', title: '同城速达，当日到家' },
  { icon: '好', title: '健康保障，品种优选' },
  { icon: '省', title: '宠友福利，优惠不断' },
])

const footerLinks = ref([
  {
    title: '购物指南',
    links: ['购物流程', '会员介绍', '宠物饲养', '常见问题', '萌宠同城', '联系客服'],
  },
  { title: '配送方式', links: ['上门自提', '211限时达', '配送服务查询', '配送费收取标准'] },
  { title: '支付方式', links: ['货到付款', '在线支付', '分期付款', '公司转账'] },
  {
    title: '售后服务',
    links: ['售后政策', '价格保护', '退款说明', '返修/退换货', '取消订单', '血统保障'],
  },
  {
    title: '特色服务',
    links: ['宠爱夺宝', 'DIY定制', '延保服务', '宠爱E卡', '宠爱通信', '幼体保育'],
  },
])

const serviceCategories = ref([
  {
    id: 1,
    title: '洗护美容',
    icon: 'fa-bath',
    bgColor: '#74C0FC',
    children: [
      { name: '基础洗浴', desc: '清洁、吹干、梳毛' },
      { name: '专业美容', desc: '修剪造型、SPA护理' },
      { name: '特殊护理', desc: '开结、去死毛、护毛' },
      { name: '指甲修剪', desc: '剪指甲、磨指甲' },
      { name: '耳朵清洁', desc: '清耳垢、预防耳螨' },
    ],
  },
  {
    id: 2,
    title: '医疗健康',
    icon: 'fa-stethoscope',
    bgColor: '#e74c3c',
    children: [
      { name: '疫苗接种', desc: '狂犬疫苗、传染病' },
      { name: '体检诊疗', desc: '常规检查、疾病治疗' },
      { name: '驱虫服务', desc: '体内外驱虫' },
      { name: '绝育手术', desc: '专业微创、术后护理' },
      { name: '牙科护理', desc: '洁牙、拔牙' },
      { name: '急救服务', desc: '24小时紧急通道' },
    ],
  },
  {
    id: 3,
    title: '寄养训练',
    icon: 'fa-home',
    bgColor: '#f39c12',
    children: [
      { name: '宠物寄养', desc: '家庭式/宠物店寄养' },
      { name: '日托服务', desc: '白天照看' },
      { name: '行为训练', desc: '基础服从、行为纠正' },
      { name: '遛狗服务', desc: '定时定点上门遛狗' },
    ],
  },
  {
    id: 4,
    title: '特殊服务',
    icon: 'fa-star',
    bgColor: '#9b59b6',
    children: [
      { name: '宠物摄影', desc: '专业棚拍、外景写真' },
      { name: '宠物殡葬', desc: '火化、骨灰处理' },
      { name: '宠物托运', desc: '国内外安全运输' },
      { name: '宠物保险', desc: '医疗险、意外险' },
      { name: '宠物相亲', desc: '同城优选配种服务' },
      { name: '按摩理疗', desc: '舒缓经络、康复理疗' },
    ],
  },
  {
    id: 5,
    title: '智能便利',
    icon: 'fa-mobile-alt',
    bgColor: '#3498db',
    children: [
      { name: '上门喂养', desc: '上门添粮、换水铲屎' },
      { name: '宠物外卖', desc: '同城鲜粮极速配送' },
      { name: '宠物保姆', desc: '24小时一对一看护' },
      { name: '心理咨询', desc: '分离焦虑、应激干预' },
    ],
  },
  {
    id: 6,
    title: '爬宠专区',
    icon: 'fa-spider',
    bgColor: '#A317FA',
    children: [
      { name: '蜕皮辅助', desc: '湿度调整、人工协助蜕皮（尤其针对眼睛、脚趾等部位）' },
      { name: '繁殖配对', desc: '发情期行为观察、产卵环境准备' },
      { name: '毒性防护指导', desc: '针对有毒物种（如某些蜘蛛、蝎子）的安全操作培训' },
      { name: '缸体清洁', desc: '除菌、除螨、去除异味（不刺激爬宠）' },
      { name: '幼体保育', desc: '单独喂养，精细照顾，确保成熟' },
    ],
  },
  {
    id: 7,
    title: '鸟类专区',
    icon: 'fa-dove',
    bgColor: '#d30505',
    children: [
      { name: '羽毛护理', desc: '羽虱检查、羽粉清洁、断羽修复' },
      { name: '喙部整形', desc: '上下喙错位矫正' },
      { name: '嗉囊护理', desc: '积食清理、嗉囊按摩' },
      { name: '孵化辅助', desc: '分离焦虑、应激干预' },
      { name: '语言教学', desc: '说话训练（针对鹦鹉类）' },
      { name: '嘴爪修剪', desc: '防止过长影响进食/抓握' },
    ],
  },
])
</script>

<style scoped>
/* --- 全局样式 --- */
.mall-wrapper {
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  background-color: #f5f5f5;
  color: #333;
  min-height: 100vh;
  overflow: hidden;
}

.container {
  width: 1200px;
  margin: 0 auto;
}
/* 核心区域样式 */
.hero-section {
  margin-top: 20px;
}
.hero-wrapper {
  display: flex;
  height: 480px;
  width: 100%;
  position: relative;
}

/* 轮播图样式 */
.slider {
  flex: 1;
  background-color: #e3e3e3;
  position: relative;
  overflow: hidden;
}
.slide-img {
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, #fbd07c 0%, #fca27e 100%);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: #fff;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}
.buy-btn {
  margin-top: 20px;
  padding: 12px 40px;
  background: #fff;
  color: #ff6700;
  border: none;
  cursor: pointer;
  font-weight: bold;
  border-radius: 4px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  transition: 0.3s;
}
.buy-btn:hover {
  background: #ff6700;
  color: #fff;
  box-shadow: 0 4px 10px rgba(255, 103, 0, 0.4);
}
.slider-nav {
  position: absolute;
  bottom: 20px;
  right: 30px;
  display: flex;
  gap: 10px;
}
.slider-dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.5);
  cursor: pointer;
}
.slider-dot.active {
  background: #fff;
}

/* 商品展示区样式 */
.section-title {
  font-size: 22px;
  font-weight: 300;
  margin: 30px 0 15px;
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
}
.section-title span {
  font-size: 14px;
  color: #666;
  cursor: pointer;
}
.section-title span:hover {
  color: #ff6700;
}

.goods-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 15px;
}

/* 响应式调整 */
@media (max-width: 1200px) {
  .container {
    width: 100%;
    padding: 0 15px;
  }
}
</style>
