<template>
  <div>
    <el-container
      style="
        position: absolute;
        left: 0;
        top: 0;
        bottom: 0;
        right: 0;
        overflow: hidden;
      "
    >
      <el-header class="d-flex align-items-center" style="background: #74b9ff">
        <!--Title -->
        <!-- <a class="h5 text-light mb-0 mr-auto">FilmFinder Home Page</a> -->
        <!-- 顶部导航栏 -->
        <nav-bar></nav-bar>
      </el-header>
      <el-container style="max-width:1080px;padding-bottom: 60px;margin: 0 auto">
        <!-- 侧边导航栏 -->
        <side-bar> </side-bar>
        <!-- 主布局 -->
        <el-main>
          <!-- 主页展示电影 -->
          <el-menu
            :default-active="activeIndex2"
            class="el-menu-demo"
            mode="horizontal"
            @select="handleSelect"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
       
          >
            
            <el-menu-item index="1">Wish List</el-menu-item>
          </el-menu>
          <el-card class="info-card" shadow="hover">
          <el-row v-if="this.mList.length" style="margin-top: 20px">
            <el-col
              :span="6"
              v-for="(o, index) in mList"
              :key="index"
              :offset="index > 0 ? 1 : 0"
            >
              <el-card :body-style="{padding:'0px'}" class="moviecard" >
                <img :src="o.poster" class="moviePoster">
                <div style="padding: 14px">
                  <!-- <span>{{o.title}} </span> -->
                  <el-row>{{ o.rate }}</el-row>
                  <div class="bottom clearfix">
                    <!-- <time class="time">{{ currentDate }}</time> -->
                    <el-link type="primary" :href="'/movie/' + o.movie_id">{{ o.title }}</el-link>
                  </div>
                </div>
              </el-card>
            </el-col>
          </el-row>
          </el-card>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      navBarIndex: "1",
      currentDate: new Date(),
      mList: [],
      wishlist: [],
    };
  },
  created: function () {
    // called when loading the home page
    this.checkIfLogon();
    this.getwishList();
  },
  watch: {
    // 如果路由有变化，会再次执行该方法
    $route: "getwishList()",
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
      if (key == "100-1") {
        console.log("Go to Personal Center");
      }
    },
    checkIfLogon() {
      this.isLogon = false;
      if (this.$cookies.isKey("isLogon")) {
        // 检查是否有Logon的coockie
        if (this.$cookies.get("isLogon") == "true") {
          // 如果已登录
          this.isLogon = "true";
          this.user_name = this.$cookies.get("user_name");
          this.user_id = this.$cookies.get("user_id");
          console.log(this.user_id);
        } else {
          this.$router.push("/login");
        }
      } else {
        this.$router.push("/login");
      }
    },
    getwishList() {
      // 获得n个电影详情
      axios
        .get(`/api/user/showWishList?user_id=${this.user_id}`)
        .then((res) => {
          console.log(res.data.data);
          this.wishlist = res.data.data;
          console.log(this.wishlist.length);
          console.log(this.wishlist[0]);
          for (var i = 0; i < this.wishlist.length; i++) {
            console.log(this.wishlist[i]);
            axios
              .get(
                `/api/movie/searchMovieByID?movie_id=${this.wishlist[i]}&user_id=0`
              )
              .then((res) => {
                if (res.status == 404) {
                  alert("Internel Error");
                  console.log("Response:");
                  console.log(res);
                } else if (res.status == 200) {
                  // console.log(res.data.data);
                  this.mList.push(res.data.data);
                }
              }); // API post
          }
        });
    },
    goTo(path) {
      this.$router.replace(path);
    },
  },
};
</script>

<style scoped>
.button {
  padding: 0;
  float: right;
}
.image {
  width: 50%;
  display: block;
  float: center;
}
.time {
  font-size: 13px;
  color: #999;
}
.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both;
}
.moviecard{
    padding-top: 15px;
    width:100%;
    height:0px;
    margin:5px;
    padding-bottom:180%;
  }
.moviePoster {
  text-align: center;
  margin: auto;
  width:60%;
  height:auto
  }
/* .home {
  background-color: #bcdef3;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
} */
</style>