<template>
  <div class="login">
    <el-form class="form" :rules="rules" :model="form" ref="form">
      <h3>Login Page</h3>
      <el-form-item label="name" label-width="80px" prop="name">
        <el-input class="item" v-model="form.name"></el-input>
      </el-form-item>
      <el-form-item label="password" label-width="80px" prop="password">
        <el-input
          class="item"
          type="password"
          v-model="form.password"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">Login</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      form: {},
      rules: {
        name: [
          {
            required: true,
            message: "please enter the username",
            trigger: "blur",
          },
          // { min: 3, max: 5, message: "3 - 5 characters", trigger: "blur" },
        ],
        password: [
          {
            required: true,
            message: "please enter the password",
            trigger: "blur",
          },
          // { min: 6, max: 12, message: "6 - 12 characters", trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    onSubmit() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          console.log(this.form)
          axios
            .get("api/user/login", {
              params: this.form,
            })
            .then((res) => {
              if (res.status == 404) {
                alert("Internel Error");
                console.log("Response:");
                console.log(res);
              } else if (res.status == 200) {
                if (res.data.code == 200){ // 如果成功登录
                  alert("Login Success!");
                  console.log("Response:");
                  console.log(res);
                  this.$router.push("/home");

                  //记录Cookie
                  this.$cookies.set('user_id', res.data.data.user_id);
                  this.$cookies.set('user_name', res.data.data.name);
                  this.$cookies.set('isLogon', true);

                }
                else{
                  alert("Login Failed!");
                  console.log("Response:");
                  console.log(res);
                }
              }
            }); // API post
          
        } else {
          return false;
        }
      });
    },
  },
};
</script>

<style scoped>
.login {
  background-color: #bcdef3;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}
.form {
  width: 40%;
  margin-bottom: 20vh;
  background-color: white;
  border-radius: 2px;
  padding: 5% 3%;
}
.item {
  width: 75%;
}
</style>