import 'package:flutter/material.dart';
import 'package:aprender_haciendo_app/src/model/productomodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
final TextStyle productTitleStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium");
final TextStyle productsubTitleStyle =
    TextStyle(fontFamily: "Poppins-Medium");
 
class ProductCard extends StatelessWidget {
  final Sets sets;
  final int cardNum;
  ProductCard({this.sets, this.cardNum});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      child: Container(
        width: ScreenUtil().setWidth(642),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: ScreenUtil().setHeight(40)
                ),
                child: Container(
                  width: ScreenUtil().setHeight(990),
                  height: ScreenUtil().setWidth(620),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                                Color(0xFF65c6f4),
                                Color(0xFF0074c9)
                              ])
                    )
                  ),
                ),
              ),
            ],
        ),
      )
    );
  }
}