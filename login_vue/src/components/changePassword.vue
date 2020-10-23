<template>
  <div class="Changepassword">
    <el-form class="form" :rules="rules" :model="form" ref="form">
      <h3>Change password</h3>
        <el-form-item label="Original Password" prop="password">
            <el-input type="password" placeholder="Please enter the original password" v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item label="New Password" prop="newPassword">
            <el-input type="password" placeholder="Please enter the new password" v-model="form.newPassword"></el-input>
        </el-form-item>
        <el-form-item label="Confirm Password" prop="newPassword2">
            <el-input type="password" placeholder="Please confirm the new password" v-model="form.newPassword2"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="onSubmit('form')">Save</el-button>
            <el-button @click="$refs['form'].resetFields()">Reset</el-button>
        </el-form-item>
    </el-form>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    let validateNewPassword = (rule, value, callback) => {
            if (value === this.form.password) {
                callback(new Error('The new password cannot be the same as the old one!'))
            } else {
                callback()
            }
        }
    let validateNewPassword2 = (rule, value, callback) => {
            if (value !== this.form.newPassword) {
                callback(new Error('Not the same as the new password!'))
            } else {
                callback()
            }
    }
    return {
        form: {},
        rules: {
            password: [
                { required: true, message: 'Please enter the original password', trigger: 'blur' }
            ],
            newPassword: [
                { required: true, message: 'Please enter the new password', trigger: 'blur' },
                { validator: validateNewPassword, trigger: 'blur' }
            ],
            newPassword2: [
                { required: true, message: 'Please confirm the new password', trigger: 'blur' },
                { validator: validateNewPassword2, trigger: 'blur' }
            ]
            }
        }
    },
  methods: {
    onSubmit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          axios.get("api/user/login",{
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
              alert('Login Success!')
              console.log('Response:')
              console.log(res)
            }
          }) // API post
          this.$router.push("/acc");
        } else {
          return false;
        }
      });
    }
  }
};
</script>

<style scoped>
.Changepassword {
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