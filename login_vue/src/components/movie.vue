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
              <img :src="moviePoster" class="image" />
            </el-col>
            <el-col :span="18">
              <!-- Movie Details -->
              <div style="padding: 14px">
                <div class="movieTitle">{{ movieTitle }}</div>
                <div class="movieOverview">{{ movieOverview }}</div>
              </div>
            </el-col>
          </el-row>
          <!-- Comment -->
          <el-row>
            <el-input type="textarea" :rows="2" v-model="comment" placeholder="Please Write Your Comment" clearable></el-input>

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
      movieTitle: this.movieTitle,
      movieOverview: this.overview,
      moviePoster: this.moviePoster,
      comment: ''
    };
  },
  created: function () {
    // called when loading the page
    this.getMovieDetail();
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
      if (key == "100-1") {
        console.log("Go to Personal Center");
      }
    },
    getMovieDetail() {
      // Obtain details of requested movie ID
      this.movieID = this.$route.params.id; //qeury he params 区别
      console.log("movieID", this.movieID);

      axios
        .get(
          "../api/movie/searchMovieByID", // 关键：..表示请求上一级
          { params: { movie_id: this.movieID } }
        )
        .then((res) => {
          if (res.status == 404) {
            alert("Internel Error");
            console.log("Response:");
            console.log(res);
          } else if (res.status == 200) {
            console.log("Response:");
            console.log(res.data.data);
            // Record movie detail
            let movieData = res.data.data;
            this.movieTitle = movieData.title;
            this.movieOverview = movieData.overview;
            this.moviePoster = movieData.poster;

            console.log(this.movieTitle);
            console.log(this.movieOverview);
            console.log(this.moviePoster);
          }
        }); // API post
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