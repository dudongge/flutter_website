import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'loading.dart';
import 'app.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Flutter 企业站实战',
  //自定义主题
  theme: mDefaultTheme,

  //添加路由
  routes: <String,WidgetBuilder>{
    "app":(BuildContext context) => App(),
    "company_info":(BuildContext context) => WebviewScaffold(
      url: "https://wwww.baidu.com",
      appBar: AppBar(
        title: Text('公司介绍'),
        leading: IconButton(icon: Icon(Icons.home), onPressed: (){
          Navigator.of(context).pushReplacementNamed('app');
        }),
      ),
    ),

  },
//指定加载页面
  home: LoadingPage(),

));

final ThemeData mDefaultTheme = ThemeData(
  primaryColor: Colors.redAccent,
);