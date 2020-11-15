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
        <!-- <el-aside width="200px">
        </el-aside> -->

        <!-- 主布局 -->
        <el-main>
          <!-- Movie Detail -->
          <el-row>
            <el-col :span="6">
              <!-- Movie Poster -->
              <!-- Interpolation inside attributes has been removed. Use v-bind or the 
              colon shorthand instead. For example, instead of 
              <div id="{{ val }}">, use <div :id="val">. -->
              <img :src="movieData.poster" class="image" />
            </el-col>
            <el-col :span="12">
              <!-- Movie Details -->
              <div style="padding: 14px">
                <el-row>
                  <el-col ><div class="movieTitle"></div>{{ movieData.title }}</el-col>
                </el-row>
                <el-row>
                  <el-col ><div class="movieOverview"></div>{{ movieData.overview }}</el-col>
                </el-row>
                <el-row>
                  <el-col ><div class="movieReleaseTime"></div>Release time: {{ movieData.release_time }}</el-col>
                </el-row>
                <el-row>
                  <el-col ><div class="genres"></div>Genres: {{ movieData.genres.map(obj => {return obj.type}) }}</el-col>
                </el-row>
                <el-row>
                  <el-col ><div class="director"></div>Director: {{ movieData.director.map(obj => {return obj.name}) }}</el-col>
                </el-row>
                <el-row>
                  <el-col ><div class="actors"></div>Actors: {{ movieData.actors.map(obj => {return obj.name}) }}</el-col>
                </el-row>
              </div>
            </el-col>
            <el-col :span="6">
              <!-- 评分和add wishlist区域 -->
              <el-row>
                <el-rate
                  v-model="movieData.rate"
                  :allow-half = "true"
                  :max = "5"
                  disabled
                  show-score
                  text-color="#ff9900"
                  score-template="{value}">
                </el-rate>
                
              </el-row>
              <!-- <span> Movie Rating {{ movieData.rate }}/10 </span> -->
              <el-row>
                <el-button v-if="!addedWish" type="primary"  @click="addToWishList()">Add to Wishlist</el-button>
                <el-button v-if="addedWish" type="success" @click="deleteFromWishList()">Added to Wish List!</el-button>
              </el-row>
            </el-col>
          </el-row>

          <!--  Review List  -->
          <el-row :span="24" v-for="(o, index) in this.reviewList" :key="index">
            <el-card class="review">
              <div slot="header" class="clearfix">
                <div style="float: left; padding: 3px 0">
                  User:
                  <el-link type="primary" :href="'/user/' + o.user_id">{{ o.user_name }}</el-link>
                </div>
                
                <div style="float: center">
                  Rating:
                  <el-rate 
                    v-model="o.rate"
                    :allow-half = "true"
                    disabled
                    :max = 5
                    show-score
                    text-color="#ff9900"
                    score-template="{value}">
                  </el-rate>
                </div>
                <el-button v-if="o.user_id === user_id" style="float: right; padding: 3px 0" type="text" @click="deleteReview(o.review_id)">
                  delete review
                </el-button>
              </div>
              <div class="text item" style="float: left; padding: 0px 20px">
                {{ o.review }}
              </div>
              
            </el-card>
          </el-row>

          <!-- Movie Recommend -->
          <!-- 
          <el-row v-if="this.mList.length">
            <el-col :span="5" v-for="(o, index) in l" :key="index" :offset="index > 0 ? 1 : 0">
              <el-card class="moviecard" :body-style="{ padding: '5px' }" shadow="hover" style="width:250px;height:300px">
                <el-row>
                  <img :src="o.poster" class="moviePoster" style="float: left">

                </el-row>
                <el-row style="padding: 14px;">
                  <span> Rate: {{o.rate}} </span><br>
                  <el-link type="primary" :href="'/movie/' + o.movie_id">{{ o.title }}</el-link>
                </el-row>
              </el-card>
            </el-col>
        </el-row> -->

          <!-- Post Review -->
          <el-row>
            <el-rate 
              v-model="reviewRating"
              :allow-half = "true"
              :max = 5
              show-score
              text-color="#ff9900"
              score-template="{value}">
            </el-rate>
            <el-input v-model="reviewInput" :span="12" type="textarea" :rows="2" placeholder="Please Write Your Comment" clearable></el-input>
            <el-button type="primary"  @click="postReview()">Post Review</el-button>
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
      // movie info
      movieID: -1,
      movieData: {},
      // let movieData = res.data.data;
      // this.movieTitle = movieData.title;
      // this.movieOverview = movieData.overview;
      // this.moviePoster = movieData.poster;
      // wishlist info
      addedWish: false,
      // review posting info
      reviewRating: 0,
      reviewInput: '',
      reviewList: {},
      // user info
      isLogon: false,
      user_name: '',
      user_id: 0, // default user id
    };
  },
  created: function () {
    // called when loading the page
    this.checkLogon();
    this.getMovieDetail();
    this.getReviewList();
    this.checkAddedWishlist();
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
      if (key == "100-1") {
        console.log("Go to Personal Center");
      }
    },
    checkLogon(){
      this.isLogon = false;
      if (this.$cookies.isKey('isLogon')){ // 检查是否有Logon的coockie
        if (this.$cookies.get('isLogon') == 'true'){ // 如果已登录
          this.isLogon = 'true';
          this.user_name = this.$cookies.get('user_name');
          this.user_id = parseInt(this.$cookies.get('user_id'));
          console.log(this.user_id);
        }
      }
    },
    getMovieDetail() {
      // Obtain details of requested movie ID
      this.movieID = parseInt(this.$route.params.id); //qeury he params 区别
      // console.log("movieID", this.movieID);
      axios
        .get(
          "../api/movie/searchMovieByID", // 关键：..表示请求上一级
          { params: { movie_id: this.movieID, user_id: this.user_id } }
        )
        .then((res) => {
          if (res.status == 404) {
            alert("Internel Error");
            console.log("Response:");
            console.log(res);
          } else if (res.status == 200) {
            console.log("Response:");
            console.log(res.data.data);
            this.movieData = res.data.data;
          }
        }); // API post
    },
    addToWishList(){
      if (this.isLogon){
        this.addedWish = !this.addedWish;
        axios.get(
            "../api/user/add_to_wishlist", // 关键：..表示请求上一级
            { params: { user_id: this.user_id, movie_id: this.movieID } }
          )
          .then((res) => {
            if (res.status == 404) {
              alert("Internel Error");
              console.log("Response:");
              console.log(res);
            } else if (res.status == 200) {
              console.log(res.data.data);
              this.$alert(`Add wishlist successful！`, "Message:", {
                    confirmButtonText: "ok",
                  });

            }
          }
        ); // API post
      }
      else{
       this.$alert(`Please login！`, "Message:", {
                    confirmButtonText: "ok",
                  });
        this.$router.push("/login");
      }
    },
    deleteFromWishList(){
      this.addedWish = !this.addedWish;
      axios.get('../api/user/remove_from_wishlist', 
                  {params: { user_id: this.user_id, movie_id: this.movieID}})
                .then((res) => {
                  if (res.status == 404) {
                    alert("Internel Error");
                    console.log("Response:");
                    console.log(res);
                  } else if (res.status == 200) {
                    this.$alert(`Removed from wishlist！`, "Message:", {
                    confirmButtonText: "ok",
                  });
                  }
                }
      )
    },
    getReviewList(){
      axios.get('../api/review/List_movie_review', 
                  {params: { user_id: this.user_id, movie_id: this.movieID}})
                .then((res) => {
                  if (res.status == 404) {
                    alert("Internel Error");
                    console.log("Response:");
                    console.log(res);
                  } else if (res.status == 200) {
                    // alert("Fetched reviews");
                    this.reviewList = res.data.data;
                  }
                }
      )
    },
    postReview(){
      axios.get('../api/review/add_review', 
                  {params: { user_id: this.user_id, movie_id: this.movieID, rate: this.reviewRating, review: this.reviewInput }})
                .then((res) => {
                  if (res.status == 404) {
                    alert("Internel Error");
                    console.log("Response:");
                    console.log(res);
                  } else if (res.status == 200) {
                    console.log(res.data.data);
                    this.$alert(`Review successful！`, "Message:", {
                    confirmButtonText: "ok",
                  });
                  }
                }
      )
      window.location.reload();
    },
    deleteReview(reviewID){
      axios
        .get(
          `/api/review/Delete_review?review_id=${reviewID}`
        )
        .then((res) => {
          if (res.status == 200) {
            this.$alert(`Delete review successful!`, "Message:", {
                    confirmButtonText: "ok",
                  });
            location.reload();
          }
        });
    },
    checkAddedWishlist(){
      axios.get('../api/user/showWishList', 
                  {params: { user_id: this.user_id}})
                .then((res) => {
                  if (res.status == 404) {
                    alert("Internel Error");
                    console.log("Response:");
                    console.log(res);
                  } else if (res.status == 200) {
                    if (res.data.data.includes(this.movieID)){
                      this.addedWish = true;
                    }
                  }
                }
      )
    }
  },
};
</script>

<style scoped>
.button {
  padding: 0;
  float: right;
}
.review {
  padding-top: 15px;
  padding-bottom: 15px;
  margin-top: 15px;
  margin-bottom: 15px;
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