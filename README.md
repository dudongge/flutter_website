# flutter_website
## 本项目是学习的项目
项目中有个 FLUTTER_WEBSET_SERTVER 文件 
这个是模拟本地服务器 进行数据显示
开启本地服务器步骤
将FLUTTER_WEBSET_SERTVER 从flutter文件中拖出来 用VSCode 打开
更改main文件中的地址 main() async {
var requestSever = await HttpServer.bind('192.168.0.4', 8080); 为本机地址  
按下F5刷新 开启本地地址

flutter 项目运行 需安装flutter 环境 [flutter_sdk](https://flutter.dev/docs/get-started/install)
打开项目之后执行脚本 Pakages get
即可以运行项目


