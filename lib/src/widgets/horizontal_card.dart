
import 'package:aprender_haciendo_app/src/model/productomodel.dart';
import 'package:flutter/material.dart';
 
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
final TextStyle cardNumStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium", color: Colors.white, fontWeight: FontWeight.w700);
final TextStyle productsubTitleStyle =
    TextStyle(fontFamily: "Poppins-Medium");
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);
 

 class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    Key key, this.itemIndex, this.producto, this.press,
  }) : super(key: key);

  final int itemIndex;
  final Sets producto;
  final Function press;


  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0 / 2,
      ),
      height: 160,
      child: InkWell(
        onTap: press,
        child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 136,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                colors: [Color(0xFF65c6f4), Color(0xFF0074c9)],
                begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 160,
              width: 200,
              child: Image.asset(
                producto.imagen,
                fit: BoxFit.cover,
                ),            
            )),
            
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                width: size.width -200,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 35,),
                    Text(
                      "${producto.codigo}",
                      style: codigoStyle,
                    ), 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                      producto.nombre,
                      style: nombreProductoStyle,
                      ),
                    ), 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                      "₡"+"${(producto.precio).toStringAsFixed(0)}",
                      style: precioStyle,
                      ),
                    ),     
                  ],
                ),
              ))
        ],
      ), 
      ),
          
    );
    
  }
}