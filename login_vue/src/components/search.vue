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
        <el-button @click="$refs['search'].resetFields()">Reset</el-button>
    </el-row>
    <li 
        v-for="(item,index) of moiveData"
        :key="index"
    >
        <img :src="item.poster">
        <el-button @click="goTo(`/movie/${item.movie_id}`)">{{ item.title }}</el-button>
    </li>
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