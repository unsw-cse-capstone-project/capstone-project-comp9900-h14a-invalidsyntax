<template>
  <div>
    <el-container style="position: absolute;left: 0;top: 0;bottom: 0;right: 0;overflow: hidden;">
      <el-header class="d-flex align-items-center" style="background: #74b9ff;">
        <!--Title -->
        <!-- <a class="h5 text-light mb-0 mr-auto">FilmFinder Home Page</a> -->
        <!-- 顶部导航栏 -->
        <el-menu
          :default-active="navBarIndex"
          class="el-menu-demo"
          mode="horizontal"
          @select="handleSelect"
          background-color="#74b9ff"
          text-color="#2d3436"
          active-text-color="#0984e3">
            <!-- Top buttoms -->
            <el-menu-item index="1">Home</el-menu-item>
            <el-menu-item index="2">b2</el-menu-item>
            <el-menu-item index="3">b3</el-menu-item>
            <el-menu-item index="4">b4</el-menu-item>
            <el-menu-item index="5">b5</el-menu-item>
            <!-- Avater -->
            <el-submenu index="100">
              <template slot="title">
                <!-- <el-avatar :size="small" src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png"></el-avatar> -->
                ACCOUNT_NAME
              </template>
              <el-menu-item index="100-1">Account management</el-menu-item>
              <el-menu-item index="100-2">Log out</el-menu-item>
            </el-submenu>
        </el-menu>
      </el-header>
      <el-container style="height: 100%;padding-bottom: 60px;">
      <!-- 侧边布局 -->
      <!-- <el-aside width="200px"> -->

        <el-row class="tac">
    <el-col :span="12">
      <h5>Account Management</h5>
      <el-menu
        default-active="2"
        class="el-menu-vertical-demo"
        @open="handleOpen"
        @close="handleClose"
      >
        <el-submenu index="1">
          <template slot="title">
            <i class="el-icon-menu"></i>
            <span>User preference</span>
          </template>
          <el-menu-item-group>
            <el-menu-item index="1-1">Wish List</el-menu-item>
            <el-menu-item index="1-2">Ban List</el-menu-item>
          </el-menu-item-group>
        </el-submenu>

        <el-submenu index="2">
          <template slot="title">
            <i class="el-icon-menu"></i>
            <span>Account information</span>
          </template>
          <el-menu-item-group>
            <el-menu-item index="/demo" @click="goTo('/changePassword')">
            <span slot="title">Change Password</span>
            </el-menu-item>
            <el-menu-item index="/index" @click="goTo('/ChangeEmail')">
            <span slot="title">Change Email</span>
            </el-menu-item>
          </el-menu-item-group>
        </el-submenu>
        
      </el-menu>
    </el-col>
    <router-view></router-view>
  </el-row>
      
        
      <!-- </el-aside> -->
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
    methods: {
      handleSelect(key, keyPath) {
        console.log(key, keyPath);
        if (key == "100-1"){
          console.log("Go to Personal Center")
        }
      },
      handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
    goTo(path) {
      this.$router.replace(path);
    }
      
    }
  }
</script>

<style scoped>
  .el-col-12{
    background-color: #bcdef3;
    width: 15%;
  }
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