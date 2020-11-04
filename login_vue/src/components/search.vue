<template>
<div>
    <nav-bar></nav-bar>
    <el-input 
        class= "search"
        placeholder="Please search"
        v-model="inputData"
        clearable>
    </el-input>
    <el-row>
        <el-button type="primary" icon="el-icon-search" @click="onSubmit">search</el-button>
        <el-button @click="resetFields()">Reset</el-button>
    </el-row>
    <el-col :span="5" 
        v-for="(item,index) of moiveData"
        :key="index"
        :offset="index > 0 ? 1 : 0"
    >
         <el-card :body-style="{ padding: '0px' }">
              <img :src="item.poster" class="image">
              <div style="padding: 14px;">
                <!-- <span>{{o.title}} </span> -->
                <div class="bottom clearfix">
                  <!-- <time class="time">{{ currentDate }}</time> -->
                  <el-button  type="text" class="button" @click="goTo(`/movie/${item.movie_id}`)">{{item.title}}  {{`   Rate:${item.rate}`}}</el-button>
                </div>
              </div>
            </el-card>
    </el-col>
</div>
</template>

<script>
import axios from "axios";

  export default {
    data() {
      return {
          inputData: '',
          moiveData:[]
      }
    },
    methods:{
        resetFields(){
            location.reload();
        },
        onSubmit() {
            axios.get(`api/movie/searchMovieByTitle/?title=${this.inputData}`).then(res=> {
                console.log(this.inputData)
                if (res.status == 200){ 
                    console.log(res.data)
                    this.moiveData = res.data.data

                    console.log(this.moiveData[0].movie_id)
                    console.log(this.moiveData)
                    alert(res.data.message)
                }
            })
        },
        goTo(path) {
            this.$router.replace(path);
        }

    }
   }
</script>