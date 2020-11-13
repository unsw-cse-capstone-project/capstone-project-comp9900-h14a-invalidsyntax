<template>
  <div>
    <el-container>
      <el-header class="d-flex align-items-center" style="background: #74b9ff">
        <!--Title -->
        <!-- <a class="h5 text-light mb-0 mr-auto">FilmFinder Home Page</a> -->
        <!-- 顶部导航栏 -->
        <nav-bar></nav-bar>
      </el-header>

      <el-container class="movie-page" style="height:100%;padding-bottom: 60px;margin: 0 auto">

        <!-- 侧边布局 -->
        <!-- <el-aside width="200px">
        </el-aside> -->

        <!-- 主布局 -->
        <el-main>

          <!-- Movie poster, rate and Movie Detail  -->
            <el-col :span = "18">

              <el-row>
                <div style="float:left; font-size: 26px">{{ movieData.title }}</div>
              </el-row>

              <!-- Movie Poster and rate-->
              <el-row style="margin-top: 15px;margin-bottom: 15px;">
                <el-col :span="8">
                  <img :src="movieData.poster" class="image" />
                  <!-- 评分和add wishlist区域 -->
                  <el-row style = "padding-top: 15px;font-size: 125%;color: #FF9900">
                    FilmFinder Rating:
                    <el-rate
                      v-model="movieData.rate"
                      :allow-half = "true"
                      :max = "5"
                      disabled
                      show-score
                      text-color="#ff9900"
                      score-template="{value}"
                      class = "movie-poster-rate">
                    </el-rate>
                  </el-row>
                  <!-- <span> Movie Rating {{ movieData.rate }}/10 </span> -->
                  <el-row>
                    <el-button v-if="!addedWish" type="primary"  @click="addToWishList()">Add to Wishlist</el-button>
                    <el-button v-if="addedWish" type="success" @click="deleteFromWishList()">Added to Wish List!</el-button>
                  </el-row>
                </el-col>

                <!-- Movie Details -->
                <el-col :span="16" class = "movie-detail">
                  <div class = "detail-text">
                    
                    <el-row>
                      <div class="genres"> Genres: <br> {{ movieData.genres.map(obj => {return obj.type}).join(', ') }} </div>
                    </el-row>
                    <br>
                    <el-row>
                      <div class="director"> Director: <br> {{ movieData.director.map(obj => {return obj.name}).join(', ') }} </div>
                    </el-row>
                    <br>
                    <el-row>
                      <div class="actors"> Actors: <br> {{ movieData.actors.map(obj => {return obj.name}).join(', ') }} </div>
                    </el-row>
                    <br>
                    <el-row>
                      <div class="movieReleaseTime"> Release time: <br> {{ movieData.release_time }} </div>
                    </el-row>
                  </div>
                </el-col>
              </el-row>

              <el-divider></el-divider>
              <el-row>
                <div style="text-align: left; font-size:20px; padding: 6px 5px"> Movie overview</div>
                <div class="movieOverview" style="text-align:left;padding: 6px 5px"> {{ movieData.overview }} </div>
              </el-row>

              <el-divider></el-divider>
              <!--  Review List  -->
              <div style="text-align: left; font-size:20px; padding: 6px 5px"> User reviews</div>
              <el-row  v-for="(o, index) in this.reviewList" :key="index" :id="`review_id_${o.review_id}`">
                <el-card class="review" shadow="hover">
                  <div slot="header" class="clearfix">

                    <el-col :span = "18">
                      <div style="float: left; padding: 0px 5px; text-align: left;">
                        <el-link type="primary" :href="'/user/' + o.user_id">{{ o.user_name }}</el-link>
                      
                        <el-rate 
                          v-model="o.rate"
                          :allow-half = "true"
                          disabled
                          :max = 5
                          text-color="#ff9900"
                          score-template="{value}">
                        </el-rate>
                      </div>
                    </el-col>

                    <el-col :span = "6">
                      <el-row>
                        <el-button v-if="o.user_id === user_id" style="float: right; padding: 3px 3px;margin:3px" type="primary" @click="deleteReview(o.review_id)">
                          Delete review
                        </el-button>
                      </el-row>
                      <el-row>
                        <el-button v-if="o.user_id === user_id" style="float: right; padding: 3px 3px;margin:3px" type="primary" @click="editReview(o)">
                          Edit review
                        </el-button>
                      </el-row>
                    </el-col>
                  </div>

                  <div class="text item" style="float: left; padding: 0px 5px">
                    {{ o.review }}
                  </div>
                </el-card>
              </el-row>

            <el-divider></el-divider>
              <!-- Post Review -->
              <el-row class = "post-review">
                <el-col :span = "16">
                  <el-input v-model="reviewInput" :span="12" type="textarea" :rows="3" placeholder="Please write your review here" clearable></el-input>
                </el-col>

                <el-col :span = "8">
                  <div> Your rating </div>
                  <el-rate 
                    v-model="reviewRating"
                    :allow-half = "true"
                    :max = 5
                    show-score
                    text-color="#ff9900"
                    score-template="{value}">
                  </el-rate>
                  <el-button type="primary"  @click="postReview()">Post Review</el-button>
                </el-col>
              </el-row>

            </el-col>

            <!-- Movie Recommend -->
            <el-col :span= "6">
              <span> Recommend For You:</span>
              <el-row v-for="(o, index) in this.recMovieList" :key="index" :offset="index > 0 ? 0 : 0">
                <el-card class="rec-movie-card" :body-style="{ padding: '5px' }" shadow="hover" >
                  <el-row>
                    <img :src="o.poster" class="moviePoster" style="margin: auto;width:120px;height:170px">

                  </el-row>
                  <el-row style="padding: 14px;">
                    <span> Rate: {{o.rate}} </span><br>
                    <el-link type="primary" :href="'/movie/' + o.movie_id">{{ o.title }}</el-link>
                  </el-row>
                </el-card>
              </el-row>
            </el-col>

          
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
      recMovieList: {},
    };
  },
  created: function () {
    // called when loading the page
    this.checkLogon();
    this.getMovieDetail();
    this.getReviewList();
    this.checkAddedWishlist();
    this.getRecommendMovie();
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
            // this.$alert(`Delete review successful!`, "Message:", {
            //         confirmButtonText: "ok",
            //       });
            location.reload();
          }
        });
    },
    editReview(review){
      this.reviewRating = review.rate;
      this.reviewInput= review.review;
      document.getElementById(`review_id_${review.review_id}`).style.display="none";
      document.getElementsByClassName("post-review")[0].scrollIntoView({block: "start", behavior: "smooth"}); //scroll to review
      axios.get(
          `/api/review/Delete_review?review_id=${review.review_id}`
      );
      
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
    },
    getRecommendMovie(){
      if (this.isLogon === 'true'){
        axios.get('../api/movie/recommend_movie', 
                  {params: { user_id: this.user_id}})
                .then((res) => {
                  if (res.status == 404) {
                    alert("Internel Error");
                    console.log("Response:");
                    console.log(res);
                  } else if (res.status == 200) {
                    this.recMovieList = res.data.data.slice(0, 5);
                  }
                }
        )
      }
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
  padding-top: 10px;
  padding-bottom: 10px;
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
.movie-rate{
  padding-top: 15px;
  padding-bottom: 15px;
}
.movie-poster-rate{
  padding-top: 15px;
  padding-bottom: 15px;
  /* font-size: 200%; */
}
.rec-movie-card{
  width:200px;
  margin-top: 15px;
  margin-bottom: 15px;
  margin-left: auto;
  margin-right: auto;
}
.detail-text{
  text-align: left;
}
/* .movie-page {
    margin: 0 auto;
    width: 100%;
  } */

</style>