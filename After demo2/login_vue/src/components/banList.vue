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
        <!-- 侧边导航栏 -->
        <side-bar> </side-bar>
        <!-- 主布局 -->
        <el-main>
          <!-- 主页展示电影 -->
           <el-row :span="20" v-for="(o, index) in banUser" :key="index">
          <el-card class="box-card">
              <div>
              <el-link style="float: left; padding: 0 0; font-size: 18px" type="primary" :href="'/user/' + banlist[index]">{{ o }}</el-link>
              <el-button
                type="success"
                icon="el-icon-check"
                @click="cancelBan(banlist[index])"
                round
                >Cancel</el-button
              >
              </div>
          </el-card>
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
      navBarIndex: "1",
      currentDate: new Date(),
      banlist: [],
      banUser: [],
    };
  },
  created: function () {
    // called when loading the home page
    this.checkIfLogon();
    this.getBanList();
  },
  watch: {
    // 如果路由有变化，会再次执行该方法
    $route: "getBanList()",
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
      if (key == "100-1") {
        console.log("Go to Personal Center");
      }
    },
    checkIfLogon() {
      this.isLogon = false;
      if (this.$cookies.isKey("isLogon")) {
        // 检查是否有Logon的coockie
        if (this.$cookies.get("isLogon") == "true") {
          // 如果已登录
          this.isLogon = "true";
          this.user_name = this.$cookies.get("user_name");
          this.user_id = this.$cookies.get("user_id");
          console.log(this.user_id);
        } else {
          this.$router.push("/login");
        }
      } else {
        this.$router.push("/login");
      }
    },
    getBanList() {
      // get ban list
      axios.get(`/api/user/showBanList?user_id=${this.user_id}`).then((res) => {
        console.log(res.data.data);
        this.banlist=res.data.data;
        for (var i = 0; i < this.banlist.length; i++){ 
        axios
          .get(`/api/user/searchUserById?user_id=${this.banlist[i]}`)
          .then((res) => {
              console.log(res.data)
            this.banUser.push(res.data.data.name);
          });
        }
        console.log(this.banUser)
      }); // API post
    },
     cancelBan(x) {
      axios
        .get(
          `../api//user/cancel_ban_someone?user_id=${this.user_id}&ban_id=${x}`
        )
        .then((res) => {
          if (res.status == 200) {
            this.$alert(`Cancel successful!`, "Message:", {
                    confirmButtonText: "ok",
                  });
 
            location.reload();
          }
        });
    },
    goTo(path) {
      this.$router.replace(path);
    },
  },
};
</script>

<style>
.text {
  font-size: 14px;
}
.item {
  padding: 18px 0;
}
.box-card {
  width: 480px;
}
</style>