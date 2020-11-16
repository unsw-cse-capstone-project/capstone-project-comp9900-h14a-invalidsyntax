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
      <el-container style="min-width:500px;max-width:1080px;padding-bottom: 60px;margin: 0 auto">
        <!-- Side-Nav-Bar -->
        <side-bar> </side-bar>
        <!-- Main layout -->
        <el-main>
        <el-menu
            :default-active="activeIndex2"
            class="el-menu-demo"
            mode="horizontal"
            @select="handleSelect"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
            style="margin-top: 20px"
          >
            
            <el-menu-item index="1">User Message</el-menu-item>
          </el-menu>

          <el-row
            :span="4"
            v-for="(o, index) of messageList"
            :key="index"
            style="margin-top: 20px"
          >
            <el-card class="box-card">
              <div slot="header" class="clearfix">
                <span>
                  <el-link
                    style="float: left; padding: 0 0; font-size: 16px"
                    type="primary"
                    :href="'/#/user/' + o.user_give_id"
                    >{{ `${o.name}  ` }}</el-link
                  >
                </span>
                <el-button style="float: right; padding: 0 0 font-size: 10px" type="text" @click="Delete(o.user_give_id)"
                  >Delete Message</el-button
                > 
              </div>
              <div class="text item">
                {{ o.message }}
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
      messageList: [],
    };
  },
  created: function () {
    // called when loading the home page
    this.checkIfLogon();
    this.getMessageList();
  },
  watch: {
    // Detect router change
    $route: "getReviewList()",
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
    getMessageList() {
      axios
        .get(`http://localhost:8080/user/showGetMessage?user_get_id=${this.user_id}`)
        .then((res) => {
          console.log(res.data.data);
          this.messageList = res.data.data;
        });
    },
    Delete(x) {
      axios
        .get(
          `http://localhost:8080/user/delete_message?user_give_id=${x}&user_get_id=${this.user_id}`
        )
        .then((res) => {
          if (res.status == 200) {
            this.$alert(`Delete Message Successfully !`, "Message:", {
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
    font-size: 16px;
  }
  .item {
    margin-bottom: 5px;
  }
  .clearfix:before{
    display: table;
    content: "";
  }

  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }
  .box-card {
    width: 800px;
  }
</style>