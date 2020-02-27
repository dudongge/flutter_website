import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget {


  List<String> banners = <String> [
    'assets/images/banners/1.jpg',
    'assets/images/banners/2.jpg',
    'assets/images/banners/1.jpg',
    'assets/images/banners/2.jpg',
  ];
  
  @override
  Widget build(BuildContext context) {
    //计算宽高 按比例
    double width = MediaQuery.of(context).size.width;
    double height = width * 540.0 / 1080.0;
    return Container(
      width: width,
      height: height,
      child: Swiper(
        itemBuilder: (BuildContext context, index){
          return Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            color: Colors.yellow,
            child:  Image.asset(
              banners[index],
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: banners.length,
        scrollDirection: Axis.horizontal,
        autoplay:  true,
      ),
    );
  }
}

