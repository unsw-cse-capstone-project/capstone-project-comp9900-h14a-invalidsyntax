<template>
  <div>
    <el-container>
      <el-header class="d-flex align-items-center" style="background: #74b9ff;">
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
        <!--  -->
        <el-row v-if="this.mList.length">
          <el-row v-for="(l, i) in mList" :key="i">
            <el-col :span="5" v-for="(o, index) in l" :key="index" :offset="index > 0 ? 1 : 0">
              <el-card class="moviecard" :body-style="{ padding: '3px' }" shadow="hover">
                <el-row>
                  <img :src="o.poster" class="moviePoster" >

                </el-row>
                <el-row style="padding: 14px;">
                  <span> Rate: {{o.rate}} </span><br>
                  <!-- <time class="time">{{ currentDate }}</time> -->
                  <el-link type="primary" :href="'/movie/' + o.movie_id">{{ o.title }}</el-link>
                </el-row>
              </el-card>
            </el-col>
          </el-row>
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
        navBarIndex: '1',
        currentDate: new Date(),
        mList: []
      };
    },
    created: function () {
      // called when loading the home page
      this.checkIfLogon();
      this.getMovieList();
    },
    watch: {
    // Detect router change
    '$route': 'getMovieList()'
    },
    methods: {
      handleSelect(key, keyPath) {
        console.log(key, keyPath);
        if (key == "100-1"){
          console.log("Go to Personal Center")
        }
      },
      checkIfLogon(){
      },
      getMovieList(){ // 获得n个电影详情
        axios.get(
          "./api/movie/list_top_movie"
        )
        .then((res) => {
          if (res.status == 404) {
            alert("Internel Error");
            console.log("Response:");
            console.log(res);
          } else if (res.status == 200) {
            // console.log(res.data.data);
            // this.mList.push(res.data.data);
            // 对对电影列表进行分组
            const chunk_size = 4;
            const nShow = 20;
            const topMovies = res.data.data.slice(0, nShow);
            for (var i = 0; i < topMovies.length; i += chunk_size){
                this.mList.push(topMovies.slice(i,i+chunk_size));
            }
            console.log(this.mList);
          }
        }); // API post
        // console.log(this.mList);
      },
      goTo(path) {
            this.$router.replace(path);
        }
    }
  }
</script>

<style scoped>
  .button {
    padding: 0;
    float: right;
  }
  .moviecard{
    padding-top: 15px;
    width:100%;
    height:0px;
    margin:5px;
    padding-bottom:150%;
    border: 0px;
  }
  .moviePoster {
    /* width: 160px;
    height: 230px; */
    text-align: center;
    margin: auto;
    width:60%;
    height:auto
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
      clear: both
  }
/* .home {
  background-color: #bcdef3;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
} */
</style>