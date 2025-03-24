<template>
  <div class="course-detail-container">
    <el-dialog :visible.sync="previewVisible" fullscreen :show-close="false" custom-class="preview-dialog">
      <div class="dialog-header">
        <span class="file-name">{{ currentResource?.originalName }}</span>
        <div class="dialog-controls">
          <el-button @click="downloadResource" type="primary" size="small">
            <i class="el-icon-download"></i>下载
          </el-button>
          <el-button @click="previewVisible = false" size="small">
            <i class="el-icon-close"></i>关闭
          </el-button>
        </div>
      </div>
      <div v-loading="previewLoading" class="preview-container">
        <video v-if="showVideo" :src="previewUrl" controls
          style="width: 100%; height: 100%; object-fit: cover;"></video>
        <vue-office-docx v-if="showDocx" :src="previewUrl" @rendered="handleRendered" @error="handlePreviewError"
          style="height: 100%" />
          <div v-if="showPptx" id="pptx-container" class="pptx-viewer"></div>
        <div v-if="previewError" class="error-tip">
          <i class="el-icon-error"></i>
          <p>暂不支持该格式的在线预览</p>
        </div>
      </div>
    </el-dialog>
    <div v-if="loading" class="loading-container">
      <div class="loading-spinner"></div>
      <span>课程加载中...</span>
    </div>
    <div v-else-if="course" class="course-detail">
      <div class="course-header">
        <img :src="getFullPath(course.coverPath)" class="course-cover" alt="课程封面">
        <div class="course-meta">
          <h1 class="course-title">{{ course.title }}</h1>
          <p class="course-description" v-if="course.description">{{ course.description }}</p>
          <div class="course-stats">
            <span class="stat-item">
              <i class="el-icon-notebook-2"></i>
              {{ course.units?.length || 0 }} 个单元
            </span>
            <span class="stat-item">
              <i class="el-icon-document"></i>
              {{ totalResources }} 个资源
            </span>
          </div>
        </div>
      </div>
      <div class="unit-list">
        <div v-for="(unit, index) in course.units" :key="unit.id" class="unit-card">
          <div class="unit-header">
            <span class="unit-index">单元 {{ index + 1 }}</span>
            <h2 class="unit-title">{{ unit.title }}</h2>
          </div>
          <div class="resource-list">
            <div v-for="resource in unit.resources" :key="resource.id" class="resource-item"
              @click="previewResource(resource)">
              <i class="file-icon" :class="getFileIcon(resource.fileType)"></i>
              <span class="resource-name">{{ resource.originalName }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import courseApi from '@/api/course';
import VueOfficeDocx from '@vue-office/docx';

export default {
  components: {
    VueOfficeDocx,
  },
  data() {
    return {
      loading: true,
      course: null,
      totalResources: 0,
      previewVisible: false,
      previewLoading: false,
      previewError: false,
      currentResource: null,
      previewUrl: '',
    };
  },
  async created() {
    try {
      const id = this.$route.params.id;
      const res = await courseApi.getCourseDetail(id);

      if (res.data.code === 1 && res.data.response) {
        this.course = res.data.response;
        this.totalResources = this.course.units?.reduce((total, unit) => {
          return total + (unit.resources?.length || 0);
        }, 0) || 0;
      } else {
        console.warn('接口返回异常:', res.data);
      }
    } catch (e) {
      console.error('课程加载失败:', e);
      this.$message.error('课程加载失败');
    } finally {
      this.loading = false;
    }
  },
  computed: {
    showDocx() {
      return ['doc', 'docx'].includes(this.getFileExtension(this.currentResource?.originalName));
    },
    showPptx() {
      return ['ppt', 'pptx'].includes(this.getFileExtension(this.currentResource?.originalName));
    },
    showVideo() {
      return ['mp4'].includes(this.getFileExtension(this.currentResource?.originalName));
    },
  },
  methods: {
    getFullPath(path) {
      if (!path) return '';
      try {
        return new URL(path, 'http://192.168.104.53:8000').href;
      } catch (e) {
        console.error('路径格式错误:', e);
        return '';
      }
    },
    getFileExtension(filename) {
      if (!filename) return '';
      return filename.split('.').pop().toLowerCase();
    },
    async previewResource(resource) {
      this.previewLoading = true;
      this.previewError = false;
      this.currentResource = resource;
      this.previewVisible = true;

      try {
        const fullPath = this.getFullPath(resource.storagePath);
        if (!fullPath) {
          this.$message.error('文件路径不存在');
          this.previewLoading = false;
          return;
        }

        const response = await this.$http.get(fullPath, {
          responseType: 'arraybuffer',
        });
        const blob = new Blob([response.data], {
          type: response.headers['content-type'],
        });
        this.previewUrl = URL.createObjectURL(blob);
      } catch (error) {
        console.error('预览失败:', error);
        this.previewError = true;
        this.$message.error('文件预览失败，请检查文件路径或文件内容');
      } finally {
        this.previewLoading = false;
      }
    },
    handleRendered() {
      console.log('文档渲染完成');
    },
    handlePreviewError() {
      this.previewError = true;
    },
    downloadResource() {
      const link = document.createElement('a');
      link.href = this.previewUrl;
      link.download = this.currentResource.originalName;
      link.click();
    },
    getFullPath(path) {
      if (!path) return '';
      try {
        return new URL(path, 'http://192.168.104.53:8000').href;
      } catch (e) {
        console.error('路径格式错误:', e);
        return '';
      }
    },
    getFileIcon(fileType) {
      const typeMap = {
        pdf: 'el-icon-document',
        doc: 'el-icon-files',
        docx: 'el-icon-files',
        ppt: 'el-icon-data-analysis',
        video: 'el-icon-video-play',
        default: 'el-icon-document'
      };
      return typeMap[fileType] || typeMap.default;
    },
  },
};
</script>

<style scoped>
.course-detail-container {
  max-width: 1200px;
  margin: 32px auto;
  padding: 0 40px;
  background: #f8f9fc;
}

.loading-container {
  height: 70vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.loading-spinner {
  width: 48px;
  height: 48px;
  border: 3px solid rgba(11, 113, 231, 0.1);
  border-top-color: #0b71e7;
  border-radius: 50%;
  animation: spin 1s linear infinite;
  margin-bottom: 16px;
}

.course-header {
  display: flex;
  gap: 40px;
  margin-bottom: 40px;
  background: linear-gradient(135deg, #f8fafe 0%, #f1f6ff 100%);
  padding: 40px;
  border-radius: 16px;
  position: relative;
  overflow: hidden;
}

.course-header::after {
  content: "";
  position: absolute;
  right: -50px;
  top: -50px;
  width: 120px;
  height: 120px;
  background: rgba(11, 113, 231, 0.05);
  border-radius: 50%;
}

.course-cover {
  width: 360px;
  height: 240px;
  border-radius: 12px;
  box-shadow: 0 8px 24px rgba(11, 113, 231, 0.15);
  border: 1px solid rgba(255, 255, 255, 0.3);
  z-index: 1;
}

.course-meta {
  flex: 1;
  position: relative;
  z-index: 1;
}

.course-title {
  font-size: 32px;
  color: #1a2b50;
  margin-bottom: 20px;
  font-weight: 600;
  line-height: 1.3;
}

.course-description {
  color: #5a6b8c;
  line-height: 1.8;
  font-size: 15px;
  margin-bottom: 25px;
  padding-right: 40px;
}

.course-stats {
  display: flex;
  gap: 40px;
  background: rgba(255, 255, 255, 0.95);
  padding: 16px 24px;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(11, 113, 231, 0.08);
  width: fit-content;
}

.stat-item {
  display: flex;
  align-items: center;
  color: #5a6b8c;
  font-size: 14px;
  font-weight: 500;
}

.stat-item i {
  margin-right: 8px;
  font-size: 20px;
  color: #0b71e7;
}

.unit-list {
  background: #fff;
  border-radius: 16px;
  box-shadow: 0 8px 32px rgba(11, 113, 231, 0.08);
  padding: 30px 40px;
}

.unit-card {
  background: #fff;
  margin-bottom: 24px;
  border-left: 4px solid #eef4ff;
  transition: all 0.3s;
  padding: 20px 24px;
  border-radius: 8px;
  position: relative;
}

.unit-card:hover {
  border-left-color: #0b71e7;
  transform: translateX(8px);
  box-shadow: 0 4px 16px rgba(11, 113, 231, 0.1);
}

.unit-header {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.unit-index {
  background: #0b71e7;
  color: #fff;
  padding: 6px 14px;
  border-radius: 20px;
  font-size: 14px;
  font-weight: 500;
  margin-right: 16px;
  box-shadow: 0 2px 8px rgba(11, 113, 231, 0.2);
}

.unit-title {
  font-size: 20px;
  color: #1a2b50;
  font-weight: 600;
  margin: 0;
}

.resource-list {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 16px;
}

.resource-item {
  display: flex;
  align-items: center;
  padding: 14px 20px;
  background: #f8f9fb;
  border-radius: 8px;
  transition: all 0.3s;
  position: relative;
  overflow: hidden;
  cursor: pointer;
}

.resource-item:hover {
  background: #fff;
  box-shadow: 0 4px 12px rgba(11, 113, 231, 0.1);
  transform: translateY(-2px);
}

.resource-item::before {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  width: 4px;
  background: #0b71e7;
  opacity: 0;
  transition: opacity 0.3s;
}

.resource-item:hover::before {
  opacity: 1;
}

.file-icon {
  font-size: 24px;
  margin-right: 12px;
  color: #5a6b8c;
  transition: color 0.3s;
}

.resource-item:hover .file-icon {
  color: #0b71e7;
}

.resource-name {
  color: #5a6b8c;
  font-size: 14px;
  font-weight: 500;
  flex: 1;
  overflow: hidden;
  text-overflow: ellipsis;
}

@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}

.preview-dialog {
  background: #f5f7fa;
  border-radius: 8px;
  overflow: hidden;
}

.dialog-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 24px;
  background: #fff;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
}

.file-name {
  font-size: 16px;
  color: #303133;
  font-weight: 500;
}

.preview-container {
  height: calc(100vh - 120px);
  background: #fff;
  margin: 16px;
  border-radius: 4px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
  display: flex;
  align-items: center;
  justify-content: center;
}

.error-tip {
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: #f56c6c;
}
</style>
