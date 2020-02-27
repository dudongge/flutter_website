import 'package:flutter/material.dart';
import '../services/news.dart';
import '../model/news.dart';

class NewsPage extends StatefulWidget {
  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  NewsListModel listData = NewsListModel([]);
  int page = 0;
  void getProductList() async {
    var data = await getNewsResult(page++);
    if (data != null) {
      NewsListModel list = NewsListModel.fromJosn(data);
      setState(() {
        if (list.data.length > 0) {
          listData.data.addAll(list.data);
        }
      });
    }
  }

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        //分割线构成器
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 1.0,
          color: Colors.grey,
        ),
        itemCount: listData.data.length,
        //列表项重构器
        itemBuilder: (BuildContext context, int index) {
          //新闻
          NewsItemModal item = listData.data[index];
          return ListTile(
            title: Text(
              item.title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              item.content,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            leading: Icon(Icons.fiber_new),
            trailing: Icon(Icons.arrow_forward),
            contentPadding: EdgeInsets.all(10.0),
            enabled: true,
            onTap: () {},
          );
        },
      ),
    );
  }
}
