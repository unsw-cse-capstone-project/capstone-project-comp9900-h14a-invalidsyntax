module.exports = {
    publicPath:'./',
    devServer: {
        disableHostCheck: false,
        host: "127.0.0.1",
        port: 8080,
        https: false,
        hotOnly: false,
        proxy: {
            '/api': {
              target: 'http://localhost:8080', // 要代理的域名
              changeOrigin: true,//允许跨域
              pathRewrite: {
                '^/api': '' // 这个是定义要访问的路径
              }
            }
        }
    },
};