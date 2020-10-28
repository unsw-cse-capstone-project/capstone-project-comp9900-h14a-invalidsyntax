<template>
  <div>
    <el-container style="position: absolute;left: 0;top: 0;bottom: 0;right: 0;overflow: hidden;">
      <el-header class="d-flex align-items-center" style="background: #74b9ff;">
        <!--Title -->
        <!-- <a class="h5 text-light mb-0 mr-auto">FilmFinder Home Page</a> -->
        <!-- 顶部导航栏 -->
        <nav-bar></nav-bar>
      </el-header>
      <el-container style="height: 100%;padding-bottom: 60px;">
      <!-- 侧边导航栏 -->
      <side-bar> </side-bar>
      <!-- 主布局 -->
      <el-main>
        <el-row>
          <el-col :span="4" v-for="(o, index) in 6" :key="o" :offset="index > 0 ? 0 : 0">
            <el-card :body-style="{ padding: '0px' }">
              <img src="https://upload.wikimedia.org/wikipedia/zh/1/13/Sheep_Without_a_Shepherd.jpg" class="image">
              <div style="padding: 14px;">
                <span>Movie {{o}} </span>
                <div class="bottom clearfix">
                  <!-- <time class="time">{{ currentDate }}</time> -->
                  <el-button type="text" class="button">Button</el-button>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>

      </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
export default {
    data() {
      return {
        navBarIndex: '1',
        currentDate: new Date()
      };
    },
    created: function () {
      // called when loading the home page
      this.checkIfLogon();
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
    }
  }
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