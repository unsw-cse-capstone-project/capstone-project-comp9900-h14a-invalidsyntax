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
        <!-- Top-Nav-Bar -->
        <nav-bar></nav-bar>
      </el-header>
      <el-container style="max-width:1080px;padding-bottom: 60px;margin: 0 auto">
        <!-- Side-Nav-Bar -->
        <side-bar> </side-bar>
        <!-- Main layout -->
        <el-main>
          <!--  -->
          <el-menu
            :default-active="activeIndex2"
            class="el-menu-demo"
            mode="horizontal"
            @select="handleSelect"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
          
          >
            
            <el-menu-item index="1">Follow List</el-menu-item>
          </el-menu>
            <el-row :span="20" v-for="(o, index) in followlist" :key="index" style="margin-top: 20px">
          <el-card class="box-card">
              <div>
              <el-link style="float: left; padding: 0 0; font-size: 18px" type="primary" :href="'/user/' + o.user_id">{{ o.name }}</el-link>
              <el-button
                type="text"
                @click="cancelFollow(o.user_id)"

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
      followUser: [],
      followlist: [],
    };
  },
  created: function () {
    // called when loading the home page
    this.checkIfLogon();
    this.getFollowList();
  },
  watch: {
    $route: "getFollowList()",
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
    getFollowList() {
      // get ban list
      axios.get(`/api/user/showFollowList?user_id=${this.user_id}`).then((res) => {
        console.log(res.data.data);
        this.followlist=res.data.data;
      }); // API post
    },
     cancelFollow(x) {
      axios
        .get(
          `../api//user/cancel_follow_someone?user_id=${this.user_id}&follow_id=${x}`
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