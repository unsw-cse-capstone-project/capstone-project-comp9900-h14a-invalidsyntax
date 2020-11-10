import Vue from "vue";
import App from "./App.vue";
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
import VueRouter from "vue-router";

import axios from 'axios';
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
Vue.prototype.$axios = axios;

Vue.config.productionTip = false;

Vue.use(VueRouter);
Vue.use(ElementUI);

import * as VueCookies from 'vue-cookies';
Vue.use(VueCookies);

// 导航条组件
import navigationbar from '@/components/navigationbar.vue'; // 顶部导航栏
Vue.component('nav-bar', navigationbar);

import sidebar from '@/components/sidebar.vue'; // 侧边导航栏
Vue.component('side-bar', sidebar);

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", redirect: "/home" },
    { path: "/register", component: () => import("@/components/register.vue") },
    { path: "/login", component: () => import("@/components/login.vue") },
    { path: "/home", 
      component: () => import("@/components/home.vue"), 
      meta: {title: 'Home Page'}
    },
    { path: "/movie/:id", 
      component: () => import("@/components/movie.vue"),
      meta: {title: 'Movie title'}
    },
    { path: "/user/:id", 
      component: () => import("@/components/user.vue"),
      meta: {title: 'User Center'}
    },
    { path: "/changePassword", component: () => import("@/components/changePassword.vue")},
    { path: "/wishList", component: () => import("@/components/wishList.vue") },
    { path: "/banList", component: () => import("@/components/banList.vue") },
    { path: "/reviewlist", component: () => import("@/components/reviewlist.vue") },
    // { path: "/acc", component: () => import("@/components/acc.vue") },

    { path: "/search", component: () => import("@/components/search.vue") },
  ]
});

router.beforeEach((to, from, next) => { //beforeEach is router's hook
  if (to.meta.title) { // check it has title
    console.log(to.meta.title)
    document.title = to.meta.title
  }
  next()
})

new Vue({
  render: h => h(App),
  router
}).$mount("#app");


