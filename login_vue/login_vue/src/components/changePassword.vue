<template>
  <div class="Changepassword">
    <el-form class="form" :rules="rules" :model="form" ref="form">
      <h3>Change Information</h3>
        <el-form-item label="Password" prop="password">
            <el-input type="password" placeholder="Please enter the new password" v-model="form.password" clearable></el-input>
        </el-form-item>
        <el-form-item label="Gender" label-width="80px" prop="Gender">
        <el-radio-group v-model="form.gender" @change="gender_change">
            <el-radio label="M" border>Male</el-radio>
            <el-radio label="F" border>Female</el-radio>
        </el-radio-group>
      </el-form-item>
        <el-form-item label="Age" prop="Age">
            <el-input type="text" placeholder="Please enter the new age" v-model="form.age" clearable></el-input>
        </el-form-item>
        <el-form-item label="Email" prop="Email">
            <el-input type="email" placeholder="Please enter the new Email" v-model="form.email" clearable></el-input>
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
        form: {
          password: "",
          gender: "",
          age: "",
          email: ""
          },
    };
  },
  created: function () {
    // called when loading the home page
    this.checkIfLogon();
    this.getInfo();
  },
  methods: {
      checkIfLogon() {
      this.isLogon = false;
      if (this.$cookies.isKey("isLogon")) {
        if (this.$cookies.get("isLogon") == "true") {
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
    getInfo() {
      axios
        .get(`../api/user/searchUserById?user_id=${this.user_id}`)
        .then((res) => {
            this.form.password = res.data.data.password
            this.form.gender = res.data.data.gender
            this.form.age = res.data.data.age
            this.form.email = res.data.data.email
        })

    },
    onSubmit() {
          axios.get(`api/user/update?user_id=${this.user_id}&password=${this.form.password}&gender=${this.form.gender}&age=${this.form.age}&email=${this.form.email}`)
          .then(res => {
            if(res.status == 404){
              alert('Internel Error')
              console.log('Response:')
              console.log(res)
            }
            else if (res.status == 200){
              this.$alert(`${res.data.message}`, "Message:", {
                    confirmButtonText: "ok",
                  });
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