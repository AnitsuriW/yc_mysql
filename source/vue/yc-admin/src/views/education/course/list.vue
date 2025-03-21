<template>
  <div class="app-container course-list">
    <div class="filter-container">
      <el-form :inline="true" :model="queryParam">
        <el-form-item label="课程名称">
          <el-input 
            v-model="queryParam.title" 
            placeholder="输入课程名称" 
            @keyup.enter.native="handleFilter"
          />
        </el-form-item>
        <el-form-item>
          <el-button 
            type="primary" 
            icon="el-icon-search" 
            @click="handleFilter"
            :loading="searchLoading"
          >查询</el-button>
          <el-button 
            type="success" 
            icon="el-icon-plus" 
            @click="handleCreate"
          >新建课程</el-button>
        </el-form-item>
      </el-form>
    </div>
    <el-table 
      v-loading="listLoading"
      :data="tableData"
      border 
      highlight-current-row
    >
      <el-table-column label="ID" prop="id" width="80" align="center" />
      
      <el-table-column label="课程名称" prop="title" min-width="200" />
      <el-table-column label="封面" width="120" align="center">
        <template slot-scope="{row}">
          <el-image 
            v-if="row.coverUrl"
            :src="row.coverUrl" 
            :preview-src-list="[row.coverUrl]"
            fit="cover"
            style="width: 80px; height: 50px; border-radius: 4px;"
          />
          <span v-else style="color: #909399">无封面</span>
        </template>
      </el-table-column>
      <el-table-column label="资源状态" align="center" width="240">
        <template slot-scope="{row}">
          <div class="unit-status">
            <el-tag :type="row.units.length ? 'success' : 'info'" size="mini">
              共 {{ row.units.length }} 个单元
            </el-tag>
            <div v-for="unit in row.units" :key="unit.id" class="unit-item">
              <div class="unit-title">{{ unit.title }}</div>
              <div v-if="unit.resources.length" class="resource-list">
                <el-tag 
                  v-for="res in unit.resources" 
                  :key="res.id"
                  size="mini"
                  type="info"
                >{{ res.originalName }}</el-tag>
              </div>
              <span v-else class="no-res">无资源</span>
            </div>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="150" fixed="right" align="center">
        <template slot-scope="{row}">
          <el-popconfirm 
            title="确认删除该课程？" 
            @confirm="handleDelete(row.id)"
          >
            <el-button 
              slot="reference" 
              type="danger" 
              size="mini" 
              icon="el-icon-delete"
            />
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>

    <pagination 
      v-show="total > 0"
      :total="total" 
      :page.sync="queryParam.pageIndex" 
      :limit.sync="queryParam.pageSize"
      @pagination="fetchData"
    />
  </div>
</template>

<script>
import Pagination from '@/components/Pagination'
import courseApi from '@/api/course'
import { createCourse } from '@/api/course'

export default {
  components: { Pagination },
  data() {
    return {
      queryParam: {
        title: '',
        pageIndex: 1,
        pageSize: 10
      },
      listLoading: false,
      tableData: [],
      total: 0,
      searchLoading: false
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    async fetchData() {
      this.listLoading = true
      try {
        const res = await courseApi.pageList(this.queryParam)
        this.tableData = res.response.list.map(item => ({
          ...item,
          coverUrl: item.coverPath ? `${item.coverPath}`: '',
          units: item.units.map(unit => ({
            ...unit,
            resources: unit.resources || []
          }))
        }))
        this.total = res.response.total
      } catch (error) {
        console.error('数据加载失败:', error)
        this.$message.error('数据加载失败')
      } finally {
        this.listLoading = false
      }
    },

    handleFilter() {
      this.queryParam.pageIndex = 1
      this.fetchData()
    },
    handleCreate() {
      this.$router.push('/education/course/edit')
    },
    async handleDelete(id) {
      try {
        await courseApi.deleteCourse(id)
        this.$message.success('删除成功')
        this.fetchData()
      } catch (error) {
        this.$message.error(error.response?.data?.message || '删除失败')
      }
    }
  }
}
</script>

<style scoped>
.unit-status {
  padding: 8px;
}
.unit-item {
  margin: 6px 0;
  padding: 4px;
  background: #f8f9fa;
  border-radius: 4px;
}
.unit-title {
  font-weight: 500;
  color: #666;
  margin-bottom: 4px;
}
.resource-list {
  display: flex;
  flex-wrap: wrap;
  gap: 4px;
}
.no-res {
  color: #999;
  font-size: 12px;
}
</style>
