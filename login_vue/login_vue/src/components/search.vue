<template>
  <div>
    <nav-bar></nav-bar>
    <div style="max-width:1080px;padding-bottom: 60px;margin: 0 auto">
    <el-card class="info-card" shadow="hover">
      <el-input
        class="search"
        placeholder="Please search"
        v-model="inputData"
        style="margin-top: 20px"
        clearable
      >
      </el-input>
      <el-row style="margin-top: 20px">
        <el-button type="primary" icon="el-icon-search" @click="onSubmitTitle"
          >Search by Title</el-button
        >
        <el-button type="primary" icon="el-icon-search" @click="onSubmitDes"
          >Search by Description</el-button
        >
        <el-button @click="resetFields()">Reset</el-button>
      </el-row>
    </el-card>
    <el-card class="info-card" shadow="hover">
      <el-form :model="form" label-width="80px">
        <el-form-item label="Genre:">
          <el-radio-group v-model="genre">
            <el-row style="margin-top: 20px">
              <el-radio label="Action" name="type"></el-radio>
              <el-radio label="Adventure" name="type"></el-radio>
              <el-radio label="Fantasy" name="type"></el-radio>
              <el-radio label="Science Fiction" name="type"></el-radio>
              <el-radio label="Crime" name="type"></el-radio>
            </el-row>
            <el-row style="margin-top: 20px">
              <el-radio label="Drama" name="type"></el-radio>
              <el-radio label="Thriller" name="type"></el-radio>
              <el-radio label="Animation" name="type"></el-radio>
              <el-radio label="Family" name="type"></el-radio>
              <el-radio label="Western" name="type"></el-radio>
            </el-row>
            <el-row style="margin-top: 20px">
              <el-radio label="Comedy" name="type"></el-radio>
              <el-radio label="Romance" name="type"></el-radio>
              <el-radio label="Horro" name="type"></el-radio>
              <el-radio label="mystery" name="type"></el-radio>
              <el-radio label="Documentary " name="type"></el-radio>
            </el-row>
          </el-radio-group>
        </el-form-item>
      </el-form>

      <el-row style="margin-top: 20px">
        <el-button type="primary" icon="el-icon-search" @click="onSubmitGenre"
          >Search by Genre</el-button
        >
      </el-row>
    </el-card>




    <el-card v-if="moiveData.length" class="info-card" shadow="hover">
      
      <el-row v-for="irow in Array(Math.ceil(moiveData.length/5)).keys()" :key="irow" style="margin-top: 20px">
        <el-col
          :span="4"
          v-for="(item, index) of moiveData.slice(irow*5, (irow+1)*5)"
          :key="index"
          :offset="index > 0 ? 1 : 0"
        >
          <el-card class="moviecard" :body-style="{ padding: '3px' }" shadow="hover">
            <el-row> <img :src="item.poster" class="moviePoster"> </el-row>
            <el-row style="padding: 14px">
              <span> Rate: {{item.rate}} </span><br>
              <!-- <span>{{o.title}} </span> -->
                <!-- <time class="time">{{ currentDate }}</time> -->
                <el-link
                  type="primary" :href="'/#/movie/' + item.movie_id">{{ item.title }}
                </el-link>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </el-card>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      inputData: "",
      moiveData: [],
      genre: "",
      form: {},
    };
  },
  created: function () {
    this.checkIfLogon();
  },
  methods: {
    resetFields() {
      location.reload();
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
    onSubmitDes() {
      axios
        .get(
          `http://localhost:8080/movie/searchMovieByDescription?user_id=${this.user_id}&des=${this.inputData}`
        )
        .then((res) => {
          console.log(this.inputData);
          if (res.status == 200) {
            console.log(res.data);
            this.moiveData = res.data.data;
            if (res.data.data.length == 0) {
              this.$alert(`No result!`, "Message:", {
                confirmButtonText: "ok",
              });
            }
            console.log(this.moiveData[0].movie_id);
            console.log(this.moiveData);
            this.$alert(`${res.data.message}`, "Message:", {
              confirmButtonText: "ok",
            });
          }
        });
    },
    onSubmitTitle() {
      axios
        .get(`http://localhost:8080/movie/searchMovieByTitle/?title=${this.inputData}`)
        .then((res) => {
          console.log(this.inputData);
          if (res.status == 200) {
            console.log(res.data);
            if (res.data.data == null) {
              this.$alert(`No result!`, "Message:", {
                confirmButtonText: "ok",
              });
            }
            this.moiveData = res.data.data;

            console.log(this.moiveData[0].movie_id);
            console.log(this.moiveData);

            this.$alert(`${res.data.message}`, "Message:", {
              confirmButtonText: "ok",
            });
          }
        });
    },
    onSubmitGenre() {
      axios
        .get(
          `http://localhost:8080/movie/searchMovieByGenre?user_id=${this.user_id}&type_name=${this.genre}`
        )
        .then((res) => {
          console.log(this.genre);
          if (res.status == 200) {
            console.log(res.data);
            res.data.data.sort((item1,item2) => {
                if (parseFloat(item2.rate)-parseFloat(item1.rate) === 0){
                  return item1.title.localeCompare(item2.title)
                }
                else{
                  return (parseFloat(item2.rate)-parseFloat(item1.rate));
                }
              })
            this.moiveData = res.data.data;
            this.moiveData;

            console.log(this.moiveData[0].movie_id);
            console.log(this.moiveData);
            this.$alert(`${res.data.message}`, "Message:", {
              confirmButtonText: "ok",
            });
          }
        });
    },

    goTo(path) {
      this.$router.replace(path);
    },
  },
};
</script>

<style >
.info-card {
  padding: 10px;
  width: 93%;
  height: auto;
  margin: 20px;
  /* padding-bottom:130%; */
  /* border: 5px; */
}
.moviePoster {
  /* width: 160px;
  height: 230px; */
  text-align: center;
  margin: auto;
  width:60%;
  height:auto
}
</style>
