<template>
  <el-container>
    <el-header height="61" class="student-header">
      <div class="head-user">
        <el-dropdown trigger="click" placement="bottom">
          <el-badge :is-dot="messageCount!==0" >
            <el-avatar  class="el-dropdown-avatar" size="medium"  :src="userInfo.imagePath === null ? require('@/assets/avatar.png') : userInfo.imagePath"></el-avatar>
          </el-badge>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item @click.native="$router.push({path:'/user/index'})">个人中心</el-dropdown-item>
            <el-dropdown-item @click.native="$router.push({path:'/user/message'})">
              <el-badge :value="messageCount" v-if="messageCount!==0">
                <span>消息中心</span>
              </el-badge>
              <span  v-if="messageCount===0">消息中心</span>
            </el-dropdown-item>
            <el-dropdown-item @click.native="logout" divided>退出</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
      <el-menu class="el-menu-title" mode="horizontal" :default-active="defaultUrl" :router="true">
        <el-menu-item index="/index">首页</el-menu-item>
        <el-menu-item index="/paper/index">试卷中心</el-menu-item>
        <el-menu-item index="/course/index">课程中心</el-menu-item>
        <el-menu-item index="/record/index">考试记录</el-menu-item>
        <el-menu-item index="/question/index">错题本</el-menu-item>
        <el-menu-item index="/chat/index">智学求索</el-menu-item>
      </el-menu>
      <div>
        <a href="/"><img src="@/assets/logo.png" height="56"/></a>
      </div>
    </el-header>
    <el-main class="student-main">
      <router-view/>
    </el-main>
    <el-footer height="340" class="student-footer" v-if="!$route.meta.hideFooter">
      <div class="foot-container">
        <div class="footer-main">
          <h4>产品介绍</h4>
          <a href="/" target="_blank" class="footer-main-link">研创智能考试系统</a>
          <a href="/" target="_blank" class="footer-main-link">研创培训考试系统</a>
          <a href="/" target="_blank" class="footer-main-link">研创开源考试系统</a>
        </div>
        <div class="footer-main">
          <h4>研创教学评价插图</h4>
          <img src="@/assets/code/3.jpg" style="width: 100px;height: 100px;margin-right: 30px"/>
          <img src="@/assets/code/7.jpg" style="width: 100px;height: 100px;margin-right: 30px"/>
          <img src="@/assets/code/1.jpg" style="width: 100px;height: 100px;"/>
        </div>
        <div class="footer-main">
          <h4>关于研创</h4>
          <img src="@/assets/4.jpg" style="width: 100px;height: 100px;"/>
        </div>
        <div class="footer-main">
          <h4>文档中心</h4>
          <a href="#" target="_blank" class="footer-main-link">研创仓库地址</a>
          <a href="#" target="_blank" class="footer-main-link">研创开发文档</a>
          <a href="#" target="_blank" class="footer-main-link">研创视频教程</a>
        </div>
      </div>
    </el-footer>
    <div class="foot-copyright">
      <span>Copyright ©2019-2025 沈阳研创科技有限公司 版权所有</span>
    </div>
  </el-container>
</template>

<script>
import { mapActions, mapMutations, mapState } from 'vuex'
import loginApi from '@/api/login'
import userApi from '@/api/user'
export default {
  name: 'Layout',
  data () {
    return {
      defaultUrl: '/index',
      userInfo: {
        imagePath: null
      }
    }
  },
  created () {
    let _this = this
    this.defaultUrl = this.routeSelect(this.$route.path)
    this.getUserMessageInfo()
    userApi.getCurrentUser().then(re => {
      _this.userInfo = re.response
    })
  },
  watch: {
    $route (to, from) {
      this.defaultUrl = this.routeSelect(to.path)
    }
  },
  methods: {
    routeSelect (path) {
      let topPath = ['/', '/index', '/paper/index', '/record/index', '/question/index']
      if (topPath.indexOf(path)) {
        return path
      }
      return null
    },
    logout () {
      let _this = this
      loginApi.logout().then(function (result) {
        if (result && result.code === 1) {
          _this.clearLogin()
          _this.$router.push({ path: '/login' })
        }
      })
    },
    ...mapActions('user', ['getUserMessageInfo']),
    ...mapMutations('user', ['clearLogin'])
  },
  computed: {
    ...mapState('user', {
      messageCount: state => state.messageCount
    })
  }
}
</script>

<style lang="scss" scoped>

</style>
