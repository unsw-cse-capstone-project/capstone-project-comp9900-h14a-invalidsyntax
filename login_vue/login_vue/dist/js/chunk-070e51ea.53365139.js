(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-070e51ea"],{"16c2":function(t,e,o){"use strict";o.r(e);var n=function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",[o("el-container",{staticStyle:{position:"absolute",left:"0",top:"0",bottom:"0",right:"0",overflow:"hidden"}},[o("el-header",{staticClass:"d-flex align-items-center",staticStyle:{background:"#74b9ff"}},[o("nav-bar")],1),o("el-container",{staticStyle:{"min-width":"500px","max-width":"1080px","padding-bottom":"60px",margin:"0 auto"}},[o("side-bar"),o("el-main",[o("el-menu",{staticClass:"el-menu-demo",staticStyle:{"margin-top":"20px"},attrs:{"default-active":t.activeIndex2,mode:"horizontal","background-color":"#545c64","text-color":"#fff","active-text-color":"#ffd04b"},on:{select:t.handleSelect}},[o("el-menu-item",{attrs:{index:"1"}},[t._v("User Message")])],1),t._l(t.messageList,(function(e,n){return o("el-row",{key:n,staticStyle:{"margin-top":"20px"},attrs:{span:4}},[o("el-card",{staticClass:"box-card"},[o("div",{staticClass:"clearfix",attrs:{slot:"header"},slot:"header"},[o("span",[o("el-link",{staticStyle:{float:"left",padding:"0 0","font-size":"16px"},attrs:{type:"primary",href:"/#/user/"+e.user_give_id}},[t._v(t._s(e.name+" "))])],1),o("el-button",{staticStyle:{float:"right",padding:"0 0 font-size: 10px"},attrs:{type:"text"},on:{click:function(o){return t.Delete(e.user_give_id)}}},[t._v("Delete Message")])],1),o("div",{staticClass:"text item"},[t._v(" "+t._s(e.message)+" ")])])],1)}))],2)],1)],1)],1)},s=[],i=(o("99af"),o("ac1f"),o("5319"),o("bc3a")),r=o.n(i),a={data:function(){return{navBarIndex:"1",messageList:[]}},created:function(){this.checkIfLogon(),this.getMessageList()},watch:{$route:"getReviewList()"},methods:{handleSelect:function(t,e){console.log(t,e),"100-1"==t&&console.log("Go to Personal Center")},checkIfLogon:function(){this.isLogon=!1,this.$cookies.isKey("isLogon")&&"true"==this.$cookies.get("isLogon")?(this.isLogon="true",this.user_name=this.$cookies.get("user_name"),this.user_id=this.$cookies.get("user_id"),console.log(this.user_id)):this.$router.push("/login")},getMessageList:function(){var t=this;r.a.get("http://localhost:8080/user/showGetMessage?user_get_id=".concat(this.user_id)).then((function(e){console.log(e.data.data),t.messageList=e.data.data}))},Delete:function(t){var e=this;r.a.get("http://localhost:8080/user/delete_message?user_give_id=".concat(t,"&user_get_id=").concat(this.user_id)).then((function(t){200==t.status&&(e.$alert("Delete Message Successfully !","Message:",{confirmButtonText:"ok"}),location.reload())}))},goTo:function(t){this.$router.replace(t)}}},c=a,l=(o("cdae"),o("2877")),u=Object(l["a"])(c,n,s,!1,null,null,null);e["default"]=u.exports},"1dde":function(t,e,o){var n=o("d039"),s=o("b622"),i=o("2d00"),r=s("species");t.exports=function(t){return i>=51||!n((function(){var e=[],o=e.constructor={};return o[r]=function(){return{foo:1}},1!==e[t](Boolean).foo}))}},"65f0":function(t,e,o){var n=o("861d"),s=o("e8b5"),i=o("b622"),r=i("species");t.exports=function(t,e){var o;return s(t)&&(o=t.constructor,"function"!=typeof o||o!==Array&&!s(o.prototype)?n(o)&&(o=o[r],null===o&&(o=void 0)):o=void 0),new(void 0===o?Array:o)(0===e?0:e)}},8418:function(t,e,o){"use strict";var n=o("c04e"),s=o("9bf2"),i=o("5c6c");t.exports=function(t,e,o){var r=n(e);r in t?s.f(t,r,i(0,o)):t[r]=o}},"99af":function(t,e,o){"use strict";var n=o("23e7"),s=o("d039"),i=o("e8b5"),r=o("861d"),a=o("7b0b"),c=o("50c4"),l=o("8418"),u=o("65f0"),d=o("1dde"),f=o("b622"),g=o("2d00"),h=f("isConcatSpreadable"),p=9007199254740991,v="Maximum allowed index exceeded",m=g>=51||!s((function(){var t=[];return t[h]=!1,t.concat()[0]!==t})),x=d("concat"),_=function(t){if(!r(t))return!1;var e=t[h];return void 0!==e?!!e:i(t)},b=!m||!x;n({target:"Array",proto:!0,forced:b},{concat:function(t){var e,o,n,s,i,r=a(this),d=u(r,0),f=0;for(e=-1,n=arguments.length;e<n;e++)if(i=-1===e?r:arguments[e],_(i)){if(s=c(i.length),f+s>p)throw TypeError(v);for(o=0;o<s;o++,f++)o in i&&l(d,f,i[o])}else{if(f>=p)throw TypeError(v);l(d,f++,i)}return d.length=f,d}})},cdae:function(t,e,o){"use strict";var n=o("fd1f"),s=o.n(n);s.a},e8b5:function(t,e,o){var n=o("c6b6");t.exports=Array.isArray||function(t){return"Array"==n(t)}},fd1f:function(t,e,o){}}]);
//# sourceMappingURL=chunk-070e51ea.53365139.js.map