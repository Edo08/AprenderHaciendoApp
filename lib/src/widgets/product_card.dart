
import 'package:aprender_haciendo_app/src/widgets/product_detail.dart';
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
  final Sets producto; 
  final ValueChanged<Sets> onSelected;
  ProductCard({Key key, this.producto, this.onSelected}) : super(key: key);

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
                  bottom: ScreenUtil().setHeight(140)
                ),
                child: new InkWell(               
                child: Container(                 
                  height: ScreenUtil().setWidth(730),
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
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(55),
                              bottom: ScreenUtil().setHeight(65)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[                               
                                Text(
                                   "${producto.codigo}",
                                   style: codigoStyle,
                                 ),
                                 Text(
                                   producto.nombre,
                                   style: nombreProductoStyle,                                  
                                 ),                                
                                Text(
                                   "\₡${(producto.precio).toStringAsFixed(0)}",
                                   style: precioStyle,
                                 ),
                                 SizedBox(
                                   height: ScreenUtil().setHeight(25),
                                 ),
                                 GestureDetector(
                                 child: Container(
                                   width: ScreenUtil().setWidth(75),
                                   height: ScreenUtil().setHeight(75),
                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(8)
                                   ),
                                   child: Center(
                                     child: Icon(
                                       Icons.add,size: 18,
                                       color: Colors.lightBlue,          
                                     ),
                                   ),
                                 ),
                                 onTap: (){
                                   print("Agregar");
                                 },
                                ),
                              ],
                            ),
                          ),
                        ),                         
                      ],
                    ),
                  ), 
                  onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetail()));},
                ),
                ),
              ),
              Positioned(
              top: ScreenUtil().setHeight(-15),
              left: ScreenUtil().setWidth(60),

              child: Hero(
                tag: producto.codigo,
                child: Image.asset(
                producto.imagen,
                width: ScreenUtil().setWidth(570),
                height: ScreenUtil().setHeight(500),
              ),),
                
            ) 
            ],
        ),
    );
  }
}