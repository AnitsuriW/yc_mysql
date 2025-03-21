import axios from '@/utils/axios' 
export default {
  getCourses() {
    return axios.get('/api/student/courses')
  },
  getCourseDetail(id) {
    return axios.get(`/api/student/course/${id}`)
  }
}
