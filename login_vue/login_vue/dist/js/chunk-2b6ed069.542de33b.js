(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2b6ed069"],{"067f":function(t,e,a){"use strict";a.r(e);var o=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[a("nav-bar"),a("div",{staticStyle:{"max-width":"1080px","padding-bottom":"60px",margin:"0 auto"}},[a("el-card",{staticClass:"info-card",attrs:{shadow:"hover"}},[a("el-input",{staticClass:"search",staticStyle:{"margin-top":"20px"},attrs:{placeholder:"Please search",clearable:""},model:{value:t.inputData,callback:function(e){t.inputData=e},expression:"inputData"}}),a("el-row",{staticStyle:{"margin-top":"20px"}},[a("el-button",{attrs:{type:"primary",icon:"el-icon-search"},on:{click:t.onSubmitTitle}},[t._v("Search by Title")]),a("el-button",{attrs:{type:"primary",icon:"el-icon-search"},on:{click:t.onSubmitDes}},[t._v("Search by Description")]),a("el-button",{on:{click:function(e){return t.resetFields()}}},[t._v("Reset")])],1)],1),a("el-card",{staticClass:"info-card",attrs:{shadow:"hover"}},[a("el-form",{attrs:{model:t.form,"label-width":"80px"}},[a("el-form-item",{attrs:{label:"Genre:"}},[a("el-radio-group",{model:{value:t.genre,callback:function(e){t.genre=e},expression:"genre"}},[a("el-row",{staticStyle:{"margin-top":"20px"}},[a("el-radio",{attrs:{label:"Action",name:"type"}}),a("el-radio",{attrs:{label:"Adventure",name:"type"}}),a("el-radio",{attrs:{label:"Fantasy",name:"type"}}),a("el-radio",{attrs:{label:"Science Fiction",name:"type"}}),a("el-radio",{attrs:{label:"Crime",name:"type"}})],1),a("el-row",{staticStyle:{"margin-top":"20px"}},[a("el-radio",{attrs:{label:"Drama",name:"type"}}),a("el-radio",{attrs:{label:"Thriller",name:"type"}}),a("el-radio",{attrs:{label:"Animation",name:"type"}}),a("el-radio",{attrs:{label:"Family",name:"type"}}),a("el-radio",{attrs:{label:"Western",name:"type"}})],1),a("el-row",{staticStyle:{"margin-top":"20px"}},[a("el-radio",{attrs:{label:"Comedy",name:"type"}}),a("el-radio",{attrs:{label:"Romance",name:"type"}}),a("el-radio",{attrs:{label:"Horro",name:"type"}}),a("el-radio",{attrs:{label:"mystery",name:"type"}}),a("el-radio",{attrs:{label:"Documentary ",name:"type"}})],1)],1)],1)],1),a("el-row",{staticStyle:{"margin-top":"20px"}},[a("el-button",{attrs:{type:"primary",icon:"el-icon-search"},on:{click:t.onSubmitGenre}},[t._v("Search by Genre")])],1)],1),t.moiveData.length?a("el-card",{staticClass:"info-card",attrs:{shadow:"hover"}},t._l(Array(Math.ceil(t.moiveData.length/5)).keys(),(function(e){return a("el-row",{key:e,staticStyle:{"margin-top":"20px"}},t._l(t.moiveData.slice(5*e,5*(e+1)),(function(e,o){return a("el-col",{key:o,attrs:{span:4,offset:o>0?1:0}},[a("el-card",{staticClass:"moviecard",attrs:{"body-style":{padding:"3px"},shadow:"hover"}},[a("el-row",[a("img",{staticClass:"moviePoster",attrs:{src:e.poster}})]),a("el-row",{staticStyle:{padding:"14px"}},[a("span",[t._v(" Rate: "+t._s(e.rate)+" ")]),a("br"),a("el-link",{attrs:{type:"primary",href:"/#/movie/"+e.movie_id}},[t._v(t._s(e.title)+" ")])],1)],1)],1)})),1)})),1):t._e()],1)],1)},r=[],n=(a("99af"),a("ac1f"),a("5319"),a("bc3a")),i=a.n(n),s={data:function(){return{inputData:"",moiveData:[],genre:"",form:{}}},created:function(){this.checkIfLogon()},methods:{resetFields:function(){location.reload()},checkIfLogon:function(){this.isLogon=!1,this.$cookies.isKey("isLogon")&&"true"==this.$cookies.get("isLogon")?(this.isLogon="true",this.user_name=this.$cookies.get("user_name"),this.user_id=this.$cookies.get("user_id"),console.log(this.user_id)):this.$router.push("/login")},onSubmitDes:function(){var t=this;i.a.get("http://localhost:8080/movie/searchMovieByDescription?user_id=".concat(this.user_id,"&des=").concat(this.inputData)).then((function(e){console.log(t.inputData),200==e.status&&(console.log(e.data),t.moiveData=e.data.data,0==e.data.data.length&&t.$alert("No result!","Message:",{confirmButtonText:"ok"}),console.log(t.moiveData[0].movie_id),console.log(t.moiveData),t.$alert("".concat(e.data.message),"Message:",{confirmButtonText:"ok"}))}))},onSubmitTitle:function(){var t=this;i.a.get("http://localhost:8080/movie/searchMovieByTitle/?title=".concat(this.inputData)).then((function(e){console.log(t.inputData),200==e.status&&(console.log(e.data),null==e.data.data&&t.$alert("No result!","Message:",{confirmButtonText:"ok"}),t.moiveData=e.data.data,console.log(t.moiveData[0].movie_id),console.log(t.moiveData),t.$alert("".concat(e.data.message),"Message:",{confirmButtonText:"ok"}))}))},onSubmitGenre:function(){var t=this;i.a.get("http://localhost:8080/movie/searchMovieByGenre?user_id=".concat(this.user_id,"&type_name=").concat(this.genre)).then((function(e){console.log(t.genre),200==e.status&&(console.log(e.data),t.moiveData=e.data.data,console.log(t.moiveData[0].movie_id),console.log(t.moiveData),t.$alert("".concat(e.data.message),"Message:",{confirmButtonText:"ok"}))}))},goTo:function(t){this.$router.replace(t)}}},l=s,c=(a("7572"),a("2877")),u=Object(c["a"])(l,o,r,!1,null,null,null);e["default"]=u.exports},"1dde":function(t,e,a){var o=a("d039"),r=a("b622"),n=a("2d00"),i=r("species");t.exports=function(t){return n>=51||!o((function(){var e=[],a=e.constructor={};return a[i]=function(){return{foo:1}},1!==e[t](Boolean).foo}))}},"65f0":function(t,e,a){var o=a("861d"),r=a("e8b5"),n=a("b622"),i=n("species");t.exports=function(t,e){var a;return r(t)&&(a=t.constructor,"function"!=typeof a||a!==Array&&!r(a.prototype)?o(a)&&(a=a[i],null===a&&(a=void 0)):a=void 0),new(void 0===a?Array:a)(0===e?0:e)}},7572:function(t,e,a){"use strict";var o=a("7b70"),r=a.n(o);r.a},"7b70":function(t,e,a){},8418:function(t,e,a){"use strict";var o=a("c04e"),r=a("9bf2"),n=a("5c6c");t.exports=function(t,e,a){var i=o(e);i in t?r.f(t,i,n(0,a)):t[i]=a}},"99af":function(t,e,a){"use strict";var o=a("23e7"),r=a("d039"),n=a("e8b5"),i=a("861d"),s=a("7b0b"),l=a("50c4"),c=a("8418"),u=a("65f0"),d=a("1dde"),m=a("b622"),p=a("2d00"),f=m("isConcatSpreadable"),h=9007199254740991,v="Maximum allowed index exceeded",y=p>=51||!r((function(){var t=[];return t[f]=!1,t.concat()[0]!==t})),g=d("concat"),b=function(t){if(!i(t))return!1;var e=t[f];return void 0!==e?!!e:n(t)},x=!y||!g;o({target:"Array",proto:!0,forced:x},{concat:function(t){var e,a,o,r,n,i=s(this),d=u(i,0),m=0;for(e=-1,o=arguments.length;e<o;e++)if(n=-1===e?i:arguments[e],b(n)){if(r=l(n.length),m+r>h)throw TypeError(v);for(a=0;a<r;a++,m++)a in n&&c(d,m,n[a])}else{if(m>=h)throw TypeError(v);c(d,m++,n)}return d.length=m,d}})},e8b5:function(t,e,a){var o=a("c6b6");t.exports=Array.isArray||function(t){return"Array"==o(t)}}}]);
//# sourceMappingURL=chunk-2b6ed069.542de33b.js.map