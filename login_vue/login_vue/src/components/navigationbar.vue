

<template>
  <!-- Top-Nav-Bar Component -->
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
    <el-menu-item index="3">My center</el-menu-item>
    <!-- <el-menu-item index="4">b4</el-menu-item>
    <el-menu-item index="5">b5</el-menu-item> --> 
    <!-- If login -->
    <el-submenu v-if = "isLogon === 'true'" index="100">
      <template slot="title">
      <!-- <el-avatar :size="small" src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png"></el-avatar> -->
      {{user_name}}
      </template>
      <!-- <el-menu-item index="100-1">User Center</el-menu-item> -->
      <el-menu-item index="100-2">Log out</el-menu-item>
    </el-submenu>
    <!-- If not login -->
    <template v-else> 
      <el-menu-item  index="6">Login</el-menu-item>
      <el-menu-item  index="7">Register</el-menu-item>
    </template>
    

  </el-menu>
  </div>
</template>


<script>
export default {
    data() {
      return {
        user_id: 0,
        navBarIndex: '1',
        currentDate: new Date(),
      };
    },
    created: function () {
      // called when loading the home page
      this.checkIfLogon();
    },
    methods: {
      checkIfLogon(){   
        this.isLogon = false;
        if (this.$cookies.isKey('isLogon')){ 
          if (this.$cookies.get('isLogon') == 'true'){ 
            this.isLogon = 'true';
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
      refreshView() {
        window.location.reload();
      },
      logout(){
        console.log('Process log out');
        this.$cookies.remove('user_id');
        this.$cookies.remove('user_name');
        this.$cookies.set('isLogon', false);
        this.$router.push("/home");
        this.refreshView();
      },
      login(){
        this.$router.push("/login");
      },
      handleSelect(key, keyPath) {
        console.log(key, keyPath);
        if (key == "1"){
          this.$router.push("/home");
        }
        if (key == "2"){
          this.$router.push("/search");
        }
        if (key == "3"){
          this.$router.push(`/user/${this.user_id}`);
        }
        if (key == "100-2"){
          this.logout();
        }
        if (key == "6"){
          this.login();
        }
        if (key == "7"){
          this.$router.push("/register");
        }
      }
    }
  }
</script>

<style scoped>
</style>