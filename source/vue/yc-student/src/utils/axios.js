/* eslint-disable */
import axios from 'axios';

const instance = axios.create({
  baseURL: 'http://192.168.104.213:8000',  
  timeout: 50000, 
});

export default instance;

instance.interceptors.request.use(config => {
    return config;
  }, error => {
    return Promise.reject(error);
  });
  
  instance.interceptors.response.use(response => {
    return response;
  }, error => {
    return Promise.reject(error);
  });
