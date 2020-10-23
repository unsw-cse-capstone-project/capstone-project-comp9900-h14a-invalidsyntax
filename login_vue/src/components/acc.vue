<template>
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
</template>

<script>
export default {
  data() {
    return {};
  },

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
};
</script>

<style scoped>
.el-col-12{
  background-color: #bcdef3;
  width: 15%;
}
</style>