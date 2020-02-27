import 'dart:convert';
import 'dart:io';
import 'data.dart';


main() async {
  var requestSever = await HttpServer.bind('192.168.0.4', 8080);
  print('http服务启动起来');

  //处理请求
  await for (HttpRequest request in requestSever){
    //request.response..write('request success...')..close();
    handleMessage(request);
  }
}

void handleMessage(HttpRequest request){
  try {
    if(request.method == 'GET'){
      handleGET(request);
    } else if(request.method == 'POST'){
      handlePOST(request);
    }
  }catch(e) {
    print('捕获了一个异常：$e');
  }
}

void handleGET(HttpRequest request){
  var action=request.uri.queryParameters['action'];
  if(action == 'getProducts'){
    var page=request.uri.queryParameters['page'];
    print('获取产品');
    request.response
    ..statusCode=HttpStatus.ok
    ..write(json.encode(products))
    ..close();
  }
    if(action == 'getNews'){
    print('获取新闻数据');
    request.response
    ..statusCode=HttpStatus.ok
    ..write(json.encode(news))
    ..close();
  }
}


void handlePOST(HttpRequest request){
  //处理post 请求
}