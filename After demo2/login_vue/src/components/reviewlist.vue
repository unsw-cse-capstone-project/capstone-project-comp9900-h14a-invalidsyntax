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
      <el-container style="height: 100%; padding-bottom: 60px">
        <!-- 侧边导航栏 -->
        <side-bar> </side-bar>
        <!-- 主布局 -->
        <el-main>
          <!-- <ul id="reviewlist1">
            <li v-for="(item, index) of reviewlist" :key="index">
              <img :src="item.poster" />
              {{ `Movie: ` }}
              <el-button @click="goTo(`/movie/${item.movie_id}`)">{{
                item.movie_id
              }}</el-button>
              {{ `Review:${item.review}` }}
            </li>
          </ul> 
          <el-table :data="reviewlist" stripe style="width: 80%">
            <el-table-column prop="movie_title" label="movie_title" width="180">
            </el-table-column>
            <el-table-column prop="rate" label="rate" width="80">
            </el-table-column>
            <el-table-column prop="review" label="review"> </el-table-column>
          </el-table>
            -->
          <el-row :span="4" v-for="(o, index) of reviewlist" :key="index">
            <el-card class="box-card">
              <div slot="header" class="clearfix">
                <span>
                    <el-link style="float: left; padding: 0 0; font-size: 18px" type="primary" :href="'/movie/' + o.movie_id">{{ `${o.movie_title}  `}}</el-link>
                    <div style="float: left; padding: 0 100px; font-size: 18px "> Rated: {{ o.rate}}/10 </div>
                </span>
                <el-button style="float: right; padding: 3px 0 font-size: 8px" type="text" @click="DeleteReview(o.review_id)"
                  >Delete Review</el-button
                >
              </div>
              <div  class="text item"> 
                {{  o.review }}
              </div>
            </el-card>
            
          </el-row>
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
      reviewlist: [],
      moviedata: [],
    };
  },
  created: function () {
    // called when loading the home page
    this.checkIfLogon();
    this.getReviewList();
  },
  watch: {
    // 如果路由有变化，会再次执行该方法
    $route: "getReviewList()",
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
    getReviewList() {
      axios
        .get(`/api/review/List_user_review?user_id=${this.user_id}`)
        .then((res) => {
          console.log(res.data.data);
          this.reviewlist = res.data.data;
          console.log(this.reviewlist);
          for (let i = 0; i < this.reviewlist.length; i++) {
            axios
              .get(
                `/api/movie/searchMovieByID?movie_id=${this.reviewlist[i].movie_id}`
              )
              .then((res) => {
                console.log(res);
                console.log(res.data.data.title);
                console.log(this.reviewlist[0].rate);
                this.moviedata[i] = {};
                this.moviedata[i].Movie = res.data.data.title;
                console.log(this.moviedata[i].Movie);
                this.moviedata[i].Rate = this.reviewlist[i].rate;
                this.moviedata[i].Review = this.reviewlist[i].review;
                console.log(this.moviedata);
              });
          }
        });
    },
    DeleteReview(x) {
      axios
        .get(
          `/api/review/Delete_review?review_id=${x}`
        )
        .then((res) => {
          if (res.status == 200) {
            this.$alert(`Cancel successful!`, "Message:", {
                    confirmButtonText: "ok",
              });
            location.reload();
          }
        });
    },
    goTo(path) {
      this.$router.replace(path);
    },
  },
};
</script>

<style>
  .text {
    font-size: 16px;
  }
  .item {
    margin-bottom: 5px;
  }
  .clearfix:before{
    display: table;
    content: "";
  }

  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }
  .box-card {
    width: 800px;
  }
</style>