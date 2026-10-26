<!-- 管理员后台首页 -->
<template>
  <div class="common-layout">
    <el-container>
      <!-- 1. 左侧侧边栏 -->
      <el-aside width="200px" class="aside-menu">
        <div class="admin-logo">
          <i class="fas fa-shield-alt"></i> 管理后台
        </div>
        <el-menu
          active-text-color="#ff6700"
          background-color="#304156"
          class="el-menu-vertical"
          default-active="1"
          text-color="#fff"
        >
          <el-menu-item index="1">
            <el-icon><i class="fas fa-users"></i></el-icon>
            <span>用户管理</span>
          </el-menu-item>
          <el-menu-item index="2">
            <el-icon><i class="fas fa-box"></i></el-icon>
            <span>商品管理</span>
          </el-menu-item>
          <el-menu-item index="3">
            <el-icon><i class="fas fa-file-invoice-dollar"></i></el-icon>
            <span>订单列表</span>
          </el-menu-item>
        </el-menu>
      </el-aside>

      <!-- 2. 右侧主体 -->
      <el-container>
        <!-- 顶部 Header -->
        <el-header class="admin-header">
          <div class="breadcrumb">首页 / 用户管理</div>
          <el-dropdown>
            <span class="el-dropdown-link">
              管理员 <i class="fas fa-chevron-down"></i>
            </span>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item @click="logout">退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </el-header>

        <!-- 中间表格区域 -->
        <el-main>
          <el-card class="box-card">
            <template #header>
              <div class="card-header">
                <span>用户列表</span>
                <el-button type="primary" size="small">新增用户</el-button>
              </div>
            </template>
            
            <!-- 表格组件 -->
            <el-table :data="tableData" style="width: 100%" stripe>
              <el-table-column prop="date" label="注册日期" width="180" />
              <el-table-column prop="name" label="姓名" width="180" />
              <el-table-column prop="role" label="角色" />
              <el-table-column label="状态">
                <template #default="scope">
                  <el-tag type="success" v-if="scope.row.status === '正常'">正常</el-tag>
                  <el-tag type="danger" v-else>禁用</el-tag>
                </template>
              </el-table-column>
              <el-table-column label="操作">
                <template #default>
                  <el-button size="small">编辑</el-button>
                  <el-button size="small" type="danger">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-card>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'

const router = useRouter()

// 模拟表格数据
const tableData = [
  { date: '2023-05-01', name: '张三', role: '普通会员', status: '正常' },
  { date: '2023-05-03', name: '李四', role: 'VIP会员', status: '正常' },
  { date: '2023-05-15', name: '王五', role: '普通会员', status: '禁用' },
  { date: '2023-06-01', name: '赵六', role: '管理员', status: '正常' },
]

const logout = () => {
  ElMessage.info('已退出管理后台')
  router.push('/')
}
</script>

<style scoped>
/* 布局样式 */
.common-layout, .el-container {
  height: 100vh; /* 全屏高度 */
}

/* 侧边栏样式 */
.aside-menu {
  background-color: #304156;
  color: white;
}
.admin-logo {
  height: 60px;
  line-height: 60px;
  text-align: center;
  font-size: 20px;
  font-weight: bold;
  background-color: #2b3a4d;
}
.el-menu-vertical {
  border-right: none;
}

/* 顶部样式 */
.admin-header {
  background-color: #fff;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: 0 1px 4px rgba(0,0,0,0.1);
  z-index: 10;
}
.el-dropdown-link {
  cursor: pointer;
  display: flex;
  align-items: center;
}

/* 头部卡片样式 */
.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>