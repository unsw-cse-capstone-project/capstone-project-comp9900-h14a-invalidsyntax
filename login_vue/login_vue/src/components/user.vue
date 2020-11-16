<template>
  <div>
    <el-container>
      <el-header class="d-flex align-items-center" style="background: #74b9ff">
        <!--Title -->
        <!-- <a class="h5 text-light mb-0 mr-auto">FilmFinder Home Page</a> -->
        <!-- Top-Nav-Bar -->
        <nav-bar></nav-bar>
      </el-header>
      <el-container style="max-width:1080px;padding-bottom: 60px;margin: 0 auto">

        <!-- Main layout -->
        <el-main>
          <!-- User Info -->
          <el-card class="info-card" shadow="hover" >
            <div>
              User Information
            </div>

            <div>
              <el-row>
                <div>
                  <el-table :data="tableData" style="width:100%;" >
                    <el-table-column prop="laber" label="" width="300">
                    </el-table-column>
                    <el-table-column prop="data" label="" width="200">
                    </el-table-column>
                  </el-table>
                </div>
              </el-row>
              <el-row style="margin-top: 20px" gutter="40">
                <el-col :span="12">
                  <el-button
                    type="danger"
                    icon="el-icon-delete"
                    @click="Ban()"
                    round
                    >Ban This User</el-button
                  >
                </el-col>
                <el-col :span="12">
                  <el-button
                    type="success"
                    icon="el-icon-check"
                    @click="cancelBan()"
                    round
                    >Cancel</el-button
                  >
                </el-col>
              </el-row>
            </div>
          </el-card>

          <el-card class="info-card" shadow="hover">
            <div>
              User Review
            </div>
            <div>
              <el-table
                :data="reviewlist"
                stripe
                style="width: 100%;">
                <el-table-column prop="movie_title" label="Movie Title" width="250">
                </el-table-column>
                <el-table-column prop="rate" label="Rate" width="80">
                </el-table-column>
                <el-table-column prop="review" label="Review"> </el-table-column>
              </el-table>

              <el-row style="margin-top: 20px" gutter="40">
                <el-col :span="12">
                  <el-button
                    type="success"
                    icon="el-icon-star-on"
                    @click="follow()"
                    round
                    >Follow This User</el-button
                  >
                </el-col>
                <el-col :span="12">
                  <el-button
                    type="danger"
                    icon="el-icon-delete"
                    @click="cancelfollow()"
                    round
                    >Cancel</el-button
                  >
                </el-col>
              </el-row>
            </div>
          </el-card>


  
          <el-card class="info-card" shadow="hover">
            <div>
              User Wish List
            </div>
            <div>
              <el-row style="margin-top: 20px">
                <el-row v-if="this.mList.length">
                  <el-col
                    :span="6"
                    v-for="(o, index) in mList"
                    :key="index"
                    :offset="index > 0 ? 1 : 0"
                  >
                    <el-card class="moviecard" :body-style="{ padding: '3px' }" shadow="hover">
                      <img :src="o.poster" class="moviePoster">
                      <div style="padding: 14px">
                        <!-- <span>{{o.title}} </span> -->
                        <span>{{ o.title }}</span>
                        <el-link type="primary" :href="'/#/movie/' + o.movie_id">{{ o.title }}</el-link>

                      </div>
                    </el-card>
                  </el-col>
                </el-row>
              </el-row>
            </div>
          </el-card>
          
          <el-card class="info-card" shadow="hover">
            <div>
              User Message
            </div>
            <div>

            <el-row
              :span="4"
              v-for="(o, index) of messageList"
              :key="index"
              style="margin-top: 20px"
            >
              <el-card class="box-card">
                <div slot="header" class="clearfix">
                  <span>
                    <el-link
                      style="float: left; padding: 0 0; font-size: 10px"
                      type="primary"
                      :href="'/#/user/' + o.user_give_id"
                      >{{ `${o.name}  ` }}</el-link
                    >
                  </span>
                </div>
                <div class="text item">
                  {{ o.message }}
                </div>
              </el-card>
            </el-row>
            <el-row>
              <el-input
                class="message"
                type="textarea"
                placeholder="Please input message"
                v-model="inputMessage"
                style="margin-top: 20px"
                clearable
                :rows="3"
              >
              </el-input>

              <el-button
                type="primary"
                icon="el-icon-search"
                @click="onSubmit()"
                style="margin-top: 20px"
                >Submit</el-button
              >
              <el-button @click="resetFields()" style="margin-left: 40px"
                >Reset</el-button
              >
            </el-row>
            </div>
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
      userID: -1,
      inputMessage: "",
      userData: {},
      mList: [],
      wishlist: [],
      messageList: [],
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
    this.getMessageList();
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
        .get(`http://localhost:8080/user/searchUserById?user_id=${this.userID}`)
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
          `http://localhost:8080//user/ban_someone?user_id=${this.user_id}&ban_id=${this.userID}`
        )
        .then((res) => {
          if (res.status == 200) {
            this.$alert(`Ban successful!`, "Message:", {
              confirmButtonText: "ok",
            });
          }
        });
    },
    cancelBan() {
      axios
        .get(
          `http://localhost:8080//user/cancel_ban_someone?user_id=${this.user_id}&ban_id=${this.userID}`
        )
        .then((res) => {
          if (res.status == 200) {
            this.$alert(`Cancel successful!`, "Message:", {
              confirmButtonText: "ok",
            });
          }
        });
    },
    follow() {
      axios
        .get(
          `http://localhost:8080//user/follow_someone?user_id=${this.user_id}&follow_id=${this.userID}`
        )
        .then((res) => {
          if (res.status == 200) {
            this.$alert(`Follow successful!`, "Message:", {
              confirmButtonText: "ok",
            });
          }
        });
    },
    cancelfollow() {
      axios
        .get(
          `http://localhost:8080//user/cancel_follow_someone?user_id=${this.user_id}&follow_id=${this.userID}`
        )
        .then((res) => {
          if (res.status == 200) {
            this.$alert(`Cancel successful!`, "Message:", {
              confirmButtonText: "ok",
            });
          }
        });
    },
    getMessageList() {
      axios
        .get(`http://localhost:8080/user/showGetMessage?user_get_id=${this.userID}`)
        .then((res) => {
          console.log(res.data.data);
          this.messageList = res.data.data;
        });
    },
    getwishList() {
      // 获得n个电影详情
      axios.get(`http://localhost:8080/user/showWishList?user_id=${this.userID}`).then((res) => {
        console.log(res.data.data);
        this.wishlist = res.data.data;
        console.log(this.wishlist.length);
        console.log(this.wishlist[0]);
        for (var i = 0; i < this.wishlist.length; i++) {
          console.log(this.wishlist[i]);
          axios
            .get(
              `http://localhost:8080/movie/searchMovieByID?movie_id=${this.wishlist[i]}&user_id=0`
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
        .get(`http://localhost:8080/review/List_user_review?user_id=${this.userID}`)
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
    onSubmit() {
      axios
        .get(
          `http://localhost:8080/user/add_message?message=${this.inputMessage}&user_give_id=${this.user_id}&user_get_id=${this.userID}`
        )
        .then((res) => {
          console.log(this.inputData);
          if (res.status == 200) {
            console.log(res.data);

            this.$alert(`${res.data.message}`, "Message:", {
              confirmButtonText: "ok",
            });
          }
        });
      window.location.reload();
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
.info-card{
  padding: 10px;
  width:93%;
  height: auto;
  margin: 20px;
  /* padding-bottom:130%; */
  /* border: 5px; */
}
.moviecard{
    padding-top: 15px;
    width:100%;
    height:0px;
    margin:5px;
    padding-bottom:150%;
  }
.moviePoster {
  text-align: center;
  margin: auto;
  width:60%;
  height:auto
}
</style>