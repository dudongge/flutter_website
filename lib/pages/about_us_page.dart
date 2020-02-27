
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/products/4.jpg',
            fit: BoxFit.cover,),
            //公司简介
            ListTile(
              title: Text('公司介绍'),
              leading: Icon(Icons.message),
              onTap: (){
                Navigator.of(context).pushReplacementNamed('company_info');
              },
            ),
            Divider(height: 10,
            color: Colors.grey,
            ),
            //公司简介
            ListTile(
              title: Text('公司优势'),
              leading: Icon(Icons.info),
            ),
            Divider(height: 10,
              color: Colors.grey,
            ),
            //公司简介
            ListTile(
              title: Text('联系我们'),
              leading: Icon(Icons.phone),
            ),
            Divider(height: 10,
              color: Colors.grey,
            ),
          ],

        ),
      ),
    );
  }

}