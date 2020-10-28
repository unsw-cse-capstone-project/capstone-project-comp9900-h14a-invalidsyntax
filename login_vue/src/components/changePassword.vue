<template>
  <div class="Changepassword">
    <el-form class="form" :rules="rules" :model="form" ref="form">
      <h3>Change Information</h3>
        <el-form-item label="User id" prop="Userid">
            <el-input type="password" placeholder="Please enter the User id" v-model="form.user_id"></el-input>
        </el-form-item>
        <el-form-item label="New Password" prop="password">
            <el-input type="password" placeholder="Please enter the original password" v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item label="New Gender" prop="newGender">
            <el-input type="password" placeholder="Please enter the new Gender M/F" v-model="form.gender"></el-input>
        </el-form-item>
        <el-form-item label="New age" prop="newAge">
            <el-input type="password" placeholder="Please enter the new age" v-model="form.age"></el-input>
        </el-form-item>
        <el-form-item label="New Email" prop="newEmail">
            <el-input type="email" placeholder="Please enter the new Email" v-model="form.email"></el-input>
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
    };
  },
  methods: {
    onSubmit() {
          axios.get("http://localhost:8080/user/update",{
                      params: this.form
                    })
          .then(res => {
            if(res.status == 404){
              alert('Internel Error')
              console.log('Response:')
              console.log(res)
            }
            else if (res.status == 200){
              alert('Change Success!')
              console.log('Response:')
              console.log(res)
            }
          }) // API post
          this.$router.push("/home");
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