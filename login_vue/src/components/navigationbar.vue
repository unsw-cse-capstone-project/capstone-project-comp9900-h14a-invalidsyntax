

<template>
  <!-- 顶部导航栏组件 -->
  <div id="navigationbar">
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
    <el-menu-item index="2">Search</el-menu-item>
    <!-- <el-menu-item index="3">b3</el-menu-item>
    <el-menu-item index="4">b4</el-menu-item>
    <el-menu-item index="5">b5</el-menu-item> -->
    <!-- 如果已经登录 -->
    <el-submenu v-if = "this.isLogon === true" index="100">
      <template slot="title">
      <!-- <el-avatar :size="small" src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png"></el-avatar> -->
        {{user_name}} 
        <el-menu-item index="100-1">User Center</el-menu-item>
        <el-menu-item index="100-2" @click="logout">Log out</el-menu-item>
      </template>
    </el-submenu>
    <!-- 如果未登录 -->
    <el-menu-item v-else index="6" @click="login">Login</el-menu-item>

  </el-menu>
  </div>
</template>


<script>
export default {
    data() {
      return {
        navBarIndex: '1',
        currentDate: new Date(),
        // isLogon: false,
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
          console.log("Go to Personal Center");
        }
        else if (key == "2"){
          this.$router.push("/search");
        }
      },
      checkIfLogon(){
        this.isLogon = false;
        if (this.$cookies.isKey('isLogon')){ // 检查是否有Logon的coockie
          if (this.$cookies.get('isLogon') == true){ // 如果已登录
            this.isLogon = true;
            this.user_name = this.$cookies.get('user_name');
            this.user_id = this.$cookies.get('user_id');
            console.log(this.user_id);
          }
          else{
            // this.$router.push("/login");
          }
        }
        else{
          // this.$router.push("/login");
        }
      },
      logout(){
        this.$cookies.remove('user_id');
        this.$cookies.remove('user_name');
        this.$cookies.set('isLogon', false);
        this.$router.push("/login");
      },
      login(){
        this.$router.push("/login");
      }
    }
  }
</script>

<style scoped>
</style>