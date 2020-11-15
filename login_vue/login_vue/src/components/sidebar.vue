<template>
  <div id="sidebar">
  <el-aside width="250px">
    <el-row class="tac">
      <el-col :span="24">
        <h5>Account Management</h5>
        <el-menu
          default-active="2"
          class="el-menu-vertical-demo"
        >
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-menu"></i>
              <span>User preference</span>
            </template>
            <el-menu-item-group>
              <el-menu-item index="1-1" @click="goTo('/wishList')">Wish List</el-menu-item>
              <el-menu-item index="1-2" @click="goTo('/banList')">Ban List</el-menu-item>
            </el-menu-item-group>
          </el-submenu>

          <el-submenu index="2">
            <template slot="title">
              <i class="el-icon-menu"></i>
              <span>Account information</span>
            </template>
            <el-menu-item-group>
              <el-menu-item index="/demo" @click="goTo('/changePassword')">
                <span slot="title">Change Information</span>
              </el-menu-item>
            </el-menu-item-group>
          </el-submenu>

          <el-submenu index="3">
            <template slot="title">
              <i class="el-icon-menu"></i>
              <span>My Review</span>
            </template>
            <el-menu-item-group>
              <el-menu-item index="/demo" @click="goTo('/reviewlist')">
                <span slot="title">Review list</span>
              </el-menu-item>
            </el-menu-item-group>
          </el-submenu>
        </el-menu>
      </el-col>
      <router-view></router-view>
    </el-row>
  </el-aside>
  </div>
</template>

<script>
export default {
  methods: {
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