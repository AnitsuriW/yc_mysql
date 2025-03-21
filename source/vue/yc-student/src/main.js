import Vue from 'vue';
import App from './App.vue';
import { router } from './router';
import store from './store';
import 'normalize.css/normalize.css';
import Element from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import '@/styles/index.scss'; // global css
import './icons'; // icon
import NProgress from 'nprogress'; // progress bar
import 'nprogress/nprogress.css'; // progress bar style
import api from '@/api/examPaperAnswer';
import axios from '@/utils/axios';

Vue.prototype.$api = api;
Vue.prototype.$http = axios;
Vue.prototype.$axios = axios;

Vue.use(Element, {
  size: 'medium' // set element-ui default size
});

Vue.config.productionTip = false;
NProgress.configure({ showSpinner: false }); // NProgress Configuration

router.beforeEach(async (to, from, next) => {
  // start progress bar
  NProgress.start();
  if (to.meta.title !== undefined) {
    document.title = to.meta.title;
  } else {
    document.title = '\u200E';
  }

  if (to.meta.bodyBackground !== undefined) {
    document.querySelector('body').setAttribute('style', 'background: ' + to.meta.bodyBackground);
  } else {
    document.querySelector('body').removeAttribute('style');
  }

  if (to.path) {
    // eslint-disable-next-line no-undef
    _hmt.push(['_trackPageview', '/#' + to.fullPath]);
  }
  next();
});

router.afterEach((to, from) => {
  // finish progress bar
  NProgress.done();
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');
Vue.prototype.$$router = router;
