// src/utils/request.js
import axios from 'axios';

const service = axios.create({
  baseURL: '/api', // 这里对应 vite.config.js 里的 /api
  timeout: 5000    // 请求超时时间
});

export default service;