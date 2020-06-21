import 'package:flutter/material.dart';
import 'package:aprender_haciendo_app/src/model/productomodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
final TextStyle productTitleStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium");
final TextStyle productCardNum =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium", color: Colors.white, fontWeight: FontWeight.w700);
final TextStyle productsubTitleStyle =
    TextStyle(fontFamily: "Poppins-Medium");
 
class ProductCard extends StatelessWidget {
  final Sets sets;
  final int cardNum;
  ProductCard({this.sets, this.cardNum});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(542),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setHeight(50),
                  bottom: ScreenUtil().setHeight(250)
                ),
                child: Container(
                  height: ScreenUtil().setWidth(620),
                  width: ScreenUtil().setHeight(990),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                                Color(0xFF65c6f4),
                                Color(0xFF0074c9)
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                              boxShadow: [BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0,8),
                                blurRadius: 8,
                                ),
                                ],
                                borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: ScreenUtil().setWidth(40),
                          top: ScreenUtil().setHeight(50),
                          child: Text(
                            "0${cardNum+1}",
                            style: productCardNum,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(45),
                              bottom: ScreenUtil().setHeight(45)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Text(
                                //   sets.nombre,
                                // )
                              ],
                            ),
                          ),)
                      ],
                    ),
                  ),
                ),
              ),
              /* Positioned(
                top: ScreenUtil().setHeight(60),
                left: ScreenUtil().setWidth(-22),
                child: Image.asset(
                  sets.image,
                  width: ScreenUtil().setWidth(640),
                  height: ScreenUtil().setHeight(610),
                ),) */
            ],
        ),
    );
  }
}