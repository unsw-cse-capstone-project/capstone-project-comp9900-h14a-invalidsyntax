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

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", redirect: "/register" },
    { path: "/home", component: () => import("@/components/home.vue") },
    { path: "/register", component: () => import("@/components/register.vue") },
    { path: "/login", component: () => import("@/components/login.vue") }, // 导航栏
    { path: "/changePassword", component: () => import("@/components/changePassword.vue")},
    { path: "/changeEmail", component: () => import("@/components/changeEmail.vue")},
    { path: "/wishList", component: () => import("@/components/wishList.vue") },
    { path: "/banList", component: () => import("@/components/banList.vue") },
    { path: "/acc", component: () => import("@/components/acc.vue") },
    { path: "/search", component: () => import("@/components/search.vue") },
  ]
});

new Vue({
  render: h => h(App),
  router
}).$mount("#app");


