import 'package:flutter/material.dart';
import '../model/product.dart';
import '../services/product.dart';
import '../pages/product_list_page.dart';

class ProductPage extends StatefulWidget {
  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {

  ProductListModel listData = ProductListModel([]);
  int page = 0;
  void getProductList() async {
    var data = await getProdutResult(page++);
    if(data != null) {
      ProductListModel list = ProductListModel.fromJosn(data);
      setState(() {
        if(list.data.length > 0) {
          listData.data.addAll(list.data);
        }
      });
    }
  }


  @override
  void initState(){
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProductResultListWidget(listData,getNextPage: () => getProductList(),);
  }


}