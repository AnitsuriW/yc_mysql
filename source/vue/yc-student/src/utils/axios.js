// src/utils/axios.js
/* eslint-disable */
import axios from 'axios';

const instance = axios.create({
  baseURL: 'http://localhost:8000',  // 后端服务地址
  timeout: 50000,  // 请求超时时间
});

export default instance;

// src/utils/axios.js
instance.interceptors.request.use(config => {
    // 请求拦截逻辑
    return config;
  }, error => {
    return Promise.reject(error);
  });
  
  instance.interceptors.response.use(response => {
    // 响应拦截逻辑
    return response;
  }, error => {
    return Promise.reject(error);
  });
