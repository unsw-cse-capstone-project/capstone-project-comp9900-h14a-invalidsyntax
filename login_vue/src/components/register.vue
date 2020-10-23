<template>
  <div class="register">
    <el-form class="form" :rules="rules" :model="form" ref="form">
      <h3>Register Page</h3>
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
      <el-form-item label="email" label-width="80px" prop="email">
        <el-input
          class="item"
          v-model="form.email"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">Register</el-button>
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
          { required: true, message: "please enter the username", trigger: "blur" },
          { min: 3, max: 5, message: "3 - 5 characters", trigger: "blur" }
        ],
        password: [
          { required: true, message: "please enter the password", trigger: "blur" },
          { min: 6, max: 12, message: "6 - 12 characters", trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    onSubmit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          axios.get("api/user/register",{
                      params: this.form
                    }
                      )
          .then(res => {
            if(res.status == 404){
              alert('Internel Error')
              console.log('Response:')
              console.log(res)
            }
            else if (res.status == 200){
              alert('Register Success!')
              console.log('Response:')
              console.log(res)
            }
          }) // API post
          this.$router.push("/home");
        } else {
          return false;
        }
      });
    }
  }
};
</script>

<style scoped>
.register {
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