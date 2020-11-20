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
        <!-- Top-Nav-Bar -->
        <nav-bar></nav-bar>
      </el-header>
      <el-container style="max-width:1080px;padding-bottom: 60px;margin: 0 auto">
        <!-- Side-Nav-Bar -->
        <side-bar> </side-bar>
        <!-- Main layout -->
        <el-main>
          <el-menu
            :default-active="activeIndex2"
            class="el-menu-demo"
            mode="horizontal"
            @select="handleSelect"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
          
          >
            
            <el-menu-item index="1" style="min-width:720px;">Review List</el-menu-item>
          </el-menu>
          <el-row :span="10" v-for="(o, index) of reviewlist" :key="index" style="margin-top: 20px">
            <el-card class="box-card" style="width: 100%">
              <div slot="header" class="clearfix">
                <span>
                    <el-link style="float: left; padding: 0 0; font-size: 18px" type="primary" :href="'/#/movie/' + o.movie_id">{{ `${o.movie_title}  `}}</el-link>
                    <div style="float: left; padding: 0 100px; font-size: 18px "> Rated: {{ o.rate}}/5 </div>
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
    // Detect router change
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
        .get(`http://localhost:8080/review/List_user_review?user_id=${this.user_id}`)
        .then((res) => {
          console.log(res.data.data);
          this.reviewlist = res.data.data;
          console.log(this.reviewlist);
          for (let i = 0; i < this.reviewlist.length; i++) {
            axios
              .get(
                `http://localhost:8080/movie/searchMovieByID?movie_id=${this.reviewlist[i].movie_id}`
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
          `http://localhost:8080/review/Delete_review?review_id=${x}`
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
    width: 1600px;
  }
</style>