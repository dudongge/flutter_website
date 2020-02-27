import 'package:flutter/material.dart';
import '../model/product.dart';
import '../pages/product_detail_page.dart';

class HomePageProductPage extends StatelessWidget {
  final ProductListModel list;
  HomePageProductPage(this.list);

  Widget build(BuildContext context) {
    double deivceWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 7.5),
      width: deivceWidth,
      child: _build(context, deivceWidth),
    );
  }


  Widget _build(BuildContext context, double deivceWidth) {
    //item 的宽度
    double itemWidth = (deivceWidth - 46 - 10 ) / 2.0;
    double imageWidth = (deivceWidth - 56 - 10 ) / 2.0;

    //返回产品列表
    List<Widget> listWidgets = list.data.map((i) {

      //返回产品项
      return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(item:i)),
          );
          },
        child: Container(
          width: itemWidth,
          margin: EdgeInsets.only(top: 10,left: 13,bottom: 7),
          color: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                i.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:TextStyle(fontSize: 15,color: Colors.white),
              ),
              Text(
                i.desc,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:TextStyle(fontSize: 15,color: Colors.white),
              ),
              Container(
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(top: 5),
                child: Image.asset(
                  i.imageUrl,
                  width: imageWidth,
                  height: imageWidth,
                ),
              ),
            ],
          ),
      ),
      );
    }).toList();

    //标题及产品列表
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5,bottom: 10),
          child:Text('最新产服务范围品',style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),),
        ),
        //流式布局列表
        Wrap(
          spacing: 2,
          children: listWidgets,
        ),
      ],
    );
  }
}


