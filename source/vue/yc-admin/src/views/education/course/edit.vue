<template>
  <div class="course-upload">
    <el-form label-width="100px">
      <el-form-item label="课程标题" required>
        <el-input v-model="form.title"></el-input>
      </el-form-item>

      <el-form-item label="课程封面">
        <el-upload action="/api/upload" :auto-upload="false" :on-change="handleCoverChange">
          <el-button size="small">选择封面</el-button>
          <div v-if="form.cover" class="cover-preview">
            <img :src="form.coverPreview" class="preview-image">
            <span class="file-name">{{ form.cover.name }}</span>
            <el-button type="text" @click="removeCover" icon="el-icon-close"></el-button>
          </div>
        </el-upload>
      </el-form-item>
    </el-form>
    <div class="unit-manager">
      <div v-for="(unit, index) in form.units" :key="index" class="unit-card">
        <div class="unit-header">
          <el-input v-model="unit.title" placeholder="单元标题" style="width: 300px"></el-input>
          <el-button type="danger" icon="el-icon-delete" circle @click="removeUnit(index)"></el-button>
        </div>
        <el-upload class="resource-upload" action="/api/upload" :multiple="true" :file-list="unit.files"
          :on-change="(file) => handleFileChange(file, unit)" :auto-upload="false">
          <el-button type="primary" icon="el-icon-upload">添加资源</el-button>
          <div slot="tip" class="upload-tip">
            支持格式：.doc/.docx, .ppt/.pptx, .mp4
          </div>
        </el-upload>
        <div class="file-list">
          <div v-for="(file, fIndex) in unit.files" :key="fIndex" class="file-item">
            <i :class="getFileIcon(file)"></i>
            <span class="file-name">{{ file.name }}</span>
            <el-progress v-if="file.uploading" :percentage="file.percentage" status="success" :stroke-width="2"
              style="width: 200px"></el-progress>
            <el-button type="text" icon="el-icon-delete" @click="removeFile(unit, fIndex)"></el-button>
          </div>
        </div>
      </div>

      <el-button type="dashed" icon="el-icon-plus" @click="addUnit">添加新单元</el-button>
    </div>

    <div class="submit-area">
      <el-button type="success" :loading="submitting" @click="submitCourse">提交课程</el-button>
    </div>
  </div>
</template>

<script>
import { createCourse } from '@/api/course'
export default {
  data() {
    return {
      submitting: false,
      form: {
        title: '',
        cover: null,
        coverPreview: '',
        units: []
      },
      responseData: {
        code: null,
        data: {}
      }
    };
  },

  methods: {
    handleCoverChange(file) {
      this.form.cover = file.raw;
      this.form.coverPreview = URL.createObjectURL(file.raw);
    },
    removeCover() {
      this.form.cover = null;
      this.form.coverPreview = '';
    },
    addUnit() {
      this.form.units.push({
        title: `单元 ${this.form.units.length + 1}`,
        files: []
      });
    },
    removeUnit(index) {
      this.form.units.splice(index, 1);
    },
    handleFileChange(file, unit) {
      const validTypes = ['doc', 'docx', 'ppt', 'pptx', 'mp4'];
      const ext = file.name.split('.').pop().toLowerCase();

      if (!validTypes.includes(ext)) {
        this.$message.error('不支持的文件格式');
        return false;
      }

      unit.files.push({
        raw: file.raw,
        name: file.name,
        type: this.detectFileType(file),
        uploading: false,
        percentage: 0
      });
    },
    removeFile(unit, index) {
      unit.files.splice(index, 1);
    },
    detectFileType(file) {
      const ext = file.name.split('.').pop().toLowerCase();
      const typeMap = {
        doc: 'DOC',
        docx: 'DOC',
        ppt: 'PPT',
        pptx: 'PPT',
        mp4: 'VIDEO'
      };
      return typeMap[ext] || 'OTHER';
    },

    getFileIcon(file) {
      const iconMap = {
        DOC: 'el-icon-document',
        PPT: 'el-icon-data-board',
        VIDEO: 'el-icon-video-camera'
      };
      return iconMap[file.type] || 'el-icon-question';
    },
    async submitCourse() {
      this.form.units = this.form.units.filter(unit =>
        unit.title.trim() !== '' && unit.files.length > 0
      );

      if (this.form.units.length === 0) {
        this.$message.error('至少需要添加一个有效单元');
        return;
      }
      if (!this.validateForm()) return;
      this.submitting = true;

      const formData = new FormData();
      formData.append('title', this.form.title);
      if (this.form.cover) {
        formData.append('cover', this.form.cover);
      }
      this.form.units.forEach((unit, unitIndex) => {
        formData.append(`units[${unitIndex}].title`, unit.title);
        (unit.files || []).forEach((file, fileIndex) => {
          formData.append(
            `units[${unitIndex}].resources[${fileIndex}].file`,
            file.raw,  
            file.name
          );
          formData.append(
            `units[${unitIndex}].resources[${fileIndex}].originalName`,
            file.name
          );
        });
      });
      try {
        const response = await createCourse(formData);
        const code = response?.data?.code ?? response?.code;
        const message = response?.data?.message ?? '操作成功';
        this.$message.success(message);
        if (response?.data?.code === 1) {
          this.resetForm();
        }
      } finally {
        this.submitting = false;
      }
      console.log([...formData.entries()]);
    },
    validateForm() {
      if (this.form.units.length === 0) {
        this.$message.error('至少添加一个单元');
        return false;
      }
      const hasInvalidUnit = this.form.units.some(unit =>
        !unit.title || unit.files.length === 0
      );
      if (hasInvalidUnit) {
        this.$message.error('单元标题或资源不能为空');
        return false;
      }
      return true;
    },

    resetForm() {
      this.form = {
        title: '',
        cover: null,
        coverPreview: '',
        units: []
      };
    }
  }
};
</script>

<style scoped>
.course-upload {
  padding: 20px;
  max-width: 800px;
  margin: 0 auto;
}

.cover-preview {
  margin-top: 10px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.preview-image {
  max-height: 100px;
  border-radius: 4px;
}

.unit-manager {
  margin-top: 20px;
}

.unit-card {
  padding: 15px;
  border: 1px solid #ebeef5;
  border-radius: 4px;
  margin-bottom: 15px;
}

.unit-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}

.file-list {
  margin-top: 10px;
}

.file-item {
  display: flex;
  align-items: center;
  padding: 8px;
  border-bottom: 1px solid #eee;
}

.file-item i {
  font-size: 20px;
  margin-right: 10px;
}

.file-name {
  flex: 1;
  margin-right: 15px;
  overflow: hidden;
  text-overflow: ellipsis;
}

.upload-tip {
  font-size: 12px;
  color: #999;
  margin-top: 5px;
}

.submit-area {
  margin-top: 30px;
  text-align: center;
}
</style>
