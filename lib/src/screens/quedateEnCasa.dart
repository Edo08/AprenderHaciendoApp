import 'package:aprender_haciendo_app/src/model/productomodel.dart';
import 'package:aprender_haciendo_app/src/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuedateEnCasa extends StatelessWidget {
  
final TextStyle newProductStyle =
    TextStyle(fontSize: 24, fontFamily: "Poppins-Bold", color: Colors.white);
final TextStyle nameProductStyle =
    TextStyle(fontSize: 20, fontFamily: "Poppins-Medium", color: Colors.white);

  @override
  Widget build(BuildContext context){
    ScreenUtil.instance = ScreenUtil(
      width: 1125,
      height: 2436,
      allowFontScaling: true
      )..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body:      
      SingleChildScrollView(    
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[           
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(0),
                left: ScreenUtil().setWidth(50),
                right: ScreenUtil().setWidth(50)
              ),
            ),
            SizedBox(
              height: 5,
            ),
              Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Quédate en casa",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins-Bold",
                fontSize: 26,
                fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text("Mantener la educación emocionante y atractiva en casa puede ser difícil. Estamos aquí para hacerlo un poco más fácil con algunos recursos para apoyar el proceso de aprendizaje en el hogar.",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins-Medium",
                fontSize: 17,),
            ),
          ),
           SizedBox(
              height: 25,
            ),
              Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Paquetes disponibles:",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins-Bold",
                fontSize: 22,
                fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(            
            height: ScreenUtil().setHeight(1050),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index){
                Sets sets = products[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(30),
                  ),
                  child: ProductCard(
                    producto: sets,                    
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            child: Container(
              height: ScreenUtil().setHeight(500),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(60),
                      vertical: ScreenUtil().setHeight(30)
                    ),
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(40),
                      left: ScreenUtil().setWidth(80),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFFf29c1f),
                        Color(0xFFf0c419),
                      ],),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Descarga gratis actividades con",
                          style: newProductStyle,
                        ),
                        Text(
                          "piezas LEGO®",
                          style: nameProductStyle,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: ScreenUtil().setHeight(150),
                    right: ScreenUtil().setWidth(170),
                    child: Icon(Icons.file_download,
                    size: 55,
                    color: Colors.white,
                    ),
                    )
                ],
              ),
            ),
          ),
          SizedBox(
              height: 10,
            ),
        ])
      )
    );
  }
}