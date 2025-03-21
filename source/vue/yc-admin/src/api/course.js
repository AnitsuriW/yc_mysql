import { post } from '@/utils/request'

export default {
  pageList: query => post('/api/admin/education/course/page', query),
  select: id => post(`/api/admin/education/course/select/${id}`),
  deleteCourse: id => post(`/api/admin/education/course/delete/${id}`),
  uploadResource: (formData, type) => post(`/api/admin/education/upload/${type}`, formData)  
}
export const createCourse = (formData) => post('api/admin/education/create', formData)
