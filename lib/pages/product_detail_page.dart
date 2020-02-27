import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductDetail extends StatelessWidget {
  final ProductItemModal item;

  ProductDetail({Key key,@required this.item}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            item.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(item.desc),
          ),
        ],
      ),
    );
  }
}
