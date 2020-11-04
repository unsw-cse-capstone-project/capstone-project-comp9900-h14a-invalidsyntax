<template>
  <div class="ChangeEmail">
    <el-form class="form" :rules="rules" :model="form" ref="form">
      <h3>Change E-mail</h3>
        <el-form-item label="New Email" prop="newEmail">
            <el-input type="email" placeholder="Please enter new Email" v-model="form.email"></el-input>
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
    return {
        form: {},
        rules: {}
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
.ChangeEmail {
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