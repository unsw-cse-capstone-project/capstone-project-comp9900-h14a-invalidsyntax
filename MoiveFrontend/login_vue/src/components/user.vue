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
        <!-- 侧边布局 -->
        <el-aside width="400px">
          <el-row>
            <el-table :data="tableData" style="width: 100%">
              <el-table-column prop="laber" label="" width="200">
              </el-table-column>
              <el-table-column prop="data" label="" width="200">
              </el-table-column>
            </el-table>
          </el-row>
          <el-row gutter="40">
            <el-col :span="12">
              <el-button type="danger" icon="el-icon-delete" @click="Ban" round
                >Ban This User</el-button
              >
            </el-col>
            <el-col :span="12">
              <el-button
                type="success"
                icon="el-icon-check"
                @click="cancelBan"
                round
                >Cancel</el-button
              >
            </el-col>
          </el-row>
        </el-aside>

        <!-- 主布局 -->
        <el-main>
          <!-- Movie Detail -->
          <el-menu
            :default-active="activeIndex2"
            class="el-menu-demo"
            mode="horizontal"
            @select="handleSelect"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
          >
            >
            <el-menu-item index="1">User wishlist</el-menu-item>
          </el-menu>
          <el-row>
            <el-row v-if="this.mList.length">
              <el-col
                :span="4"
                v-for="(o, index) in mList"
                :key="index"
                :offset="index > 0 ? 0 : 0"
              >
                <el-card :body-style="{ padding: '0px' }">
                  <img :src="o.poster" class="image" />
                  <div style="padding: 14px">
                    <!-- <span>{{o.title}} </span> -->
                    <span>{{ o.title }}</span>
                    <div class="bottom clearfix">
                      <!-- <time class="time">{{ currentDate }}</time> -->
                      <el-button
                        type="text"
                        class="button"
                        @click="goTo(`/movie/${o.movie_id}`)"
                        >{{ o.title }}</el-button
                      >
                    </div>
                  </div>
                </el-card>
              </el-col>
            </el-row>
          </el-row>
          <el-menu
            :default-active="activeIndex2"
            class="el-menu-demo"
            mode="horizontal"
            @select="handleSelect"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
          >
            >
            <el-menu-item index="1">User Reviewlist</el-menu-item>
          </el-menu>
          <el-table :data="reviewlist" stripe style="width: 100%">
            <el-table-column prop="movie_title" label="movie_title" width="180">
            </el-table-column>
            <el-table-column prop="rate" label="rate" width="80">
            </el-table-column>
            <el-table-column prop="review" label="review"> </el-table-column>
          </el-table>
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
      userID: -1,
      userData: {},
      mList: [],
      wishlist: [],
      tableData: [
        {
          laber: "Username",
          data: "",
        },
        {
          laber: "Age",
          data: "",
        },
        {
          laber: "Gender",
          data: "",
        },
        {
          laber: "Email",
          data: "",
        },
      ],
    };
  },
  created: function () {
    // called when loading the page
    this.getUserDetail();
    this.checkLogon();
    this.getwishList();
    this.getReviewList();
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
      if (key == "100-1") {
        console.log("Go to Personal Center");
      }
    },
    checkLogon() {
      this.isLogon = false;
      if (this.$cookies.isKey("isLogon")) {
        // 检查是否有Logon的coockie
        if (this.$cookies.get("isLogon") == "true") {
          // 如果已登录
          this.isLogon = "true";
          this.user_name = this.$cookies.get("user_name");
          this.user_id = parseInt(this.$cookies.get("user_id"));
          console.log(this.user_id);
        }
      }
    },
    getUserDetail() {
      // Obtain details of requested movie ID
      this.userID = parseInt(this.$route.params.id); //qeury he params 区别
      console.log("userid:", this.userID);

      axios
        .get(`../api/user/searchUserById?user_id=${this.userID}`)
        .then((res) => {
          if (res.status == 404) {
            alert("Internel Error");
            console.log("Response:");
            console.log(res);
          } else if (res.status == 200) {
            console.log("Response:");
            console.log(res.data.data);
            this.userData = res.data.data;
            console.log(this.userData.age);
            console.log(this.userData.name);
            this.tableData[0].data = this.userData.name;
            this.tableData[1].data = this.userData.age;
            this.tableData[2].data = this.userData.gender;
            this.tableData[3].data = this.userData.email;
            console.log(this.tableData);
          }
        }); // API post
    },
    Ban() {
      axios
        .get(
          `../api//user/ban_someone?user_id=${this.user_id}&ban_id=${this.userID}`
        )
        .then((res) => {
          if (res.status == 200) {
            alert("Ban successful!");
          }
        });
    },
    cancelBan() {
      axios
        .get(
          `../api//user/cancel_ban_someone?user_id=${this.user_id}&ban_id=${this.userID}`
        )
        .then((res) => {
          if (res.status == 200) {
            alert("Cancel successful!");
          }
        });
    },
    getwishList() {
      // 获得n个电影详情
      axios.get(`/api/user/showWishList?user_id=${this.userID}`).then((res) => {
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
    getReviewList() {
      axios
        .get(`/api/review/List_user_review?user_id=${this.userID}`)
        .then((res) => {
          console.log(res.data.data);
          this.reviewlist = res.data.data;
          console.log(this.reviewlist)
          for (let i = 0; i < this.reviewlist.length; i++) {
            axios
              .get(
                `/api/movie/searchMovieByID?movie_id=${this.reviewlist[i].movie_id}`
              )
              .then((res) => {
                  console.log(res)
                  console.log(res.data.data.title)
                  console.log(this.reviewlist[0].rate)
                  this.moviedata[i]={}
                  this.moviedata[i].Movie = res.data.data.title
                  console.log(this.moviedata[i].Movie)
                  this.moviedata[i].Rate = this.reviewlist[i].rate
                  this.moviedata[i].Review = this.reviewlist[i].review
                  console.log(this.moviedata)
              })
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
  width: 90%;
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
/* .home {
  background-color: #bcdef3;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
} */
</style>