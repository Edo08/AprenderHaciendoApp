import 'package:flutter/material.dart';
import 'package:aprender_haciendo_app/src/model/productomodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
final TextStyle codigoStyle =
    TextStyle(fontSize: 15, fontFamily: "Muli", color: Colors.white,
     fontWeight: FontWeight.w700,
     shadows: <Shadow>[
      Shadow(
        offset: Offset(3.0, 1.0),
        blurRadius: 3.0,
        color: Color.fromARGB(150, 0, 0, 0),
      )] );
final TextStyle precioStyle =
    TextStyle(fontSize: 16, fontFamily: "Muli", color: Colors.white, fontWeight: FontWeight.w500);
final TextStyle nombreProductoStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium", color: Colors.white, fontWeight: FontWeight.w700);
final TextStyle productCardNumStyle =
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
                                Color(0xFF65a6f4),
                                Color(0xFF25cfff)
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
                        /* Positioned(
                          left: ScreenUtil().setWidth(40),
                          top: ScreenUtil().setHeight(50),
                          child: Text(
                            "0${cardNum+1}",
                            style: productCardNumStyle,
                          ),
                        ), */
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
                                Text(
                                   "${sets.codigo}",
                                   style: codigoStyle,
                                 ),
                                 Text(
                                   sets.nombre,
                                   style: nombreProductoStyle,
                                 ),                                
                                Text(
                                   "\₡${sets.precio}",
                                   style: precioStyle,
                                 ),
                              ],
                            ),
                          ),)
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
              top: ScreenUtil().setHeight(10),
              left: ScreenUtil().setWidth(50),
              child: Image.asset(
                sets.image,
                width: ScreenUtil().setWidth(600),
                height: ScreenUtil().setHeight(530),
              ),
            ) 
            ],
        ),
    );
  }
}