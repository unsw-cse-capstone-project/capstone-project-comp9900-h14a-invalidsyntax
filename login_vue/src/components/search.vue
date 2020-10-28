<template>
<div>
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
    <div>
        <img :src="item.poster">
        {{ item.title }}
    </div>
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
                    console.log(this.moiveData.length)
                    console.log(this.moiveData)
                    alert(res.data.message)
                }
            })
        }
    }
   }
</script>