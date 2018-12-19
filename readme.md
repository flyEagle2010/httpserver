* docker 里面解决部分golang/x/*下面的包不能安装的问题
* 这里用的mod做包管理，主要下面的用代理源处理

1. ENV GO111MODULE=on
2. ENV GOPROXY=https://goproxy.io
3. 开发阶段设置环境变量就好
* Linux
export GOPROXY=https://goproxy.io
* powershell win 
$env:GOPROXY = "https://goproxy.io"