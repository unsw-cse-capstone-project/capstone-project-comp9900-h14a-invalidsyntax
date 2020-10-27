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
    }
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


