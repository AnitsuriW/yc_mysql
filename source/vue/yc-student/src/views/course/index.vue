<template>
  <div class="course-container">
    <div v-if="loading" class="loading-wrapper">
      <div class="loader"></div>
      <div class="loading-text">课程加载中...</div>
    </div>
    <div v-else-if="courses.length === 0" class="empty-state">
      <img src="@/assets/empty-course.png" class="empty-img">
      <div class="empty-text">暂无课程，快去挑选其他课程吧~</div>
    </div>
    <div v-else class="course-grid">
      <div class="course-item" v-for="course in courses" :key="course.id" @click="goDetail(course.id)">
        <div class="course-thumb">
          <img :src="getFullPath(course.coverPath)" class="cover-image" :alt="course.title">
          <div v-if="course.tags" class="course-tags">
            <span v-for="(tag, index) in course.tags" :key="index" class="course-tag"
              :style="{ backgroundColor: tagColors[index % 4] }">
              {{ tag }}
            </span>
          </div>
        </div>

        <div class="course-content">
          <h3 class="course-title">{{ course.title }}</h3>

          <div class="course-meta">
            <div class="meta-item">
              <i class="fas fa-user-friends"></i>
              {{ course.studentCount || 0 }}人报名
            </div>
            <div class="meta-item">
              <i class="fas fa-star"></i>
              {{ course.score || 4.9 }}
            </div>
          </div>

          <div class="course-footer">
            <div class="course-price">
              <template v-if="course.price > 0">
                <span class="current-price">¥{{ course.price }}</span>
                <span v-if="course.originPrice" class="origin-price">¥{{ course.originPrice }}</span>
              </template>
              <span v-else class="free">免费</span>
            </div>
            <button class="course-action" @click.stop="handleEnroll(course.id)">
              立即学习
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import courseApi from '@/api/course'

export default {
  data() {
    return {
      loading: true,
      courses: [],
      tagColors: ['#f56c6c', '#67c23a', '#409eff', '#e6a23c']
    }
  },
  async created() {
    try {
      const response = await courseApi.getCourses()
      if (response.data.code === 1) {
        this.courses = response.data.response || []
      }
    } catch (e) {
      console.error('课程加载失败:', e)
      this.$message.error('课程加载失败')
    } finally {
      this.loading = false
    }
  },
  methods: {
    getFullPath(path) {
      const cleanPath = path?.startsWith('/') ? path.substring(1) : path || ''
      return `http://localhost:8000/${cleanPath}`
    },
    goDetail(id) {
      this.$router.push(`/course/${id}`)
    },
    handleEnroll(courseId) {
      this.goDetail(courseId)
    },

  }
}
</script>

<style scoped>
.course-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 24px 20px;
}

.loading-wrapper {
  text-align: center;
  padding: 100px 0;
}

.loading-text {
  color: #909399;
  margin-top: 12px;
}


.empty-state {
  text-align: center;
  padding: 80px 0;
}

.empty-img {
  width: 200px;
  opacity: 0.6;
}

.empty-text {
  color: #909399;
  margin-top: 20px;
  font-size: 16px;
}

.course-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 24px;
}

.course-item {
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
  transition: all 0.3s ease;
  cursor: pointer;
  overflow: hidden;
}

.course-item:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.course-thumb {
  position: relative;
  height: 160px;
}

.cover-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 12px 12px 0 0;
}

.course-tags {
  position: absolute;
  top: 12px;
  left: 12px;
  display: flex;
  gap: 8px;
}

.course-tag {
  padding: 4px 10px;
  border-radius: 4px;
  color: #fff;
  font-size: 12px;
  line-height: 1;
}

.course-content {
  padding: 16px;
}

.course-title {
  font-size: 16px;
  color: #303133;
  line-height: 1.5;
  margin: 0 0 12px;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}

.course-meta {
  display: flex;
  gap: 16px;
  margin-bottom: 16px;
  color: #909399;
  font-size: 12px;
}

.meta-item i {
  margin-right: 4px;
}

/* 课程底部 */
.course-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.current-price {
  color: #f56c6c;
  font-size: 18px;
  font-weight: 600;
}

.origin-price {
  color: #909399;
  text-decoration: line-through;
  margin-left: 8px;
  font-size: 12px;
}

.free {
  color: #67c23a;
  font-weight: 500;
}

/* 操作按钮 */
.course-action {
  background: #409eff;
  color: #fff;
  border: none;
  padding: 8px 16px;
  border-radius: 4px;
  cursor: pointer;
  transition: background 0.3s;
}

.course-action:hover {
  background: #66b1ff;
}
</style>
