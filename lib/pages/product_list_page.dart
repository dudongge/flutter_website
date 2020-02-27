import 'package:flutter/material.dart';
import '../model/product.dart';
import '../services/product.dart';
import '../pages/product_detail_page.dart';

class ProductResultListWidget extends StatelessWidget {
  //列表数据
  final ProductListModel list;
  //获取下一页数据
  final VoidCallback getNextPage;
  ProductResultListWidget(this.list, {this.getNextPage});

  @override
  Widget build(BuildContext context) {
    return list.data.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: list.data.length,
            itemBuilder: (BuildContext context, int i) {
              ProductItemModal item = list.data[i];
              if ((i + 4) == list.data.length) {
                getNextPage();
              }
              return GestureDetector(

                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetail(item:item)),
                  );
                },
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 5.0,right: 5.0),
                  child: Row(
                    children: <Widget>[
                      //产品图片
                      Image.asset(item.imageUrl,
                      width: 120 ,
                      height: 120,),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: Colors.grey,
                              )
                            )
                          ),
                          //产品信息垂直布局
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(item.desc,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 5,
                                  ),
                                  //产品类型
                                  Text(
                                    item.type,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                  //产品特点
                                  Container(
                                    child: Text('性能强悍',
                                    style: TextStyle(color: Colors.blue),),
                                    padding: EdgeInsets.symmetric(horizontal: 3),
                                    margin:EdgeInsets.only(left: 4),
                                    decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.blue)),
                                  ),
                                ],
                              ),
                              Text(
                                item.name,
                                style: TextStyle(fontSize: 16,color: Colors.deepPurpleAccent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );

                ListTile(
                title: Text(item.name),
              );
            });
  }
}
