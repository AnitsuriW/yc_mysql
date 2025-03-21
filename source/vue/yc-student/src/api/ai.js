import axios from '@/utils/axios' 

export default {
  chat(question) {
    return axios.post('/api/ai/chat', {  message: question })
  },
  
  getHistory() {
    return axios.get('/api/ai/history')
  }
}
