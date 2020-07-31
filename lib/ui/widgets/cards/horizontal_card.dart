
import 'package:aprender_haciendo_app/core/models/paquetesmodel.dart';
import 'package:flutter/material.dart';
 
final TextStyle precioStyle =
    TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500);
final TextStyle nombreProductoStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium", color: Colors.white, fontWeight: FontWeight.w700);
final TextStyle productsubTitleStyle =
    TextStyle(fontFamily: "Poppins-Medium");

 class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    Key key, this.itemIndex, this.pack, this.press,
  }) : super(key: key);

  final int itemIndex;
  final Packs pack;
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
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 130,
              width: 190,
              child: Image.asset(
                pack.imagen,
                fit: BoxFit.fitWidth,
                ),            
            )),
            
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 160,
                width: size.width -200,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 55,), 
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          pack.nombre,
                          style: nombreProductoStyle,
                          textAlign: TextAlign.center,
                        ),
                      ), 
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                        "₡"+"${(pack.precio).toStringAsFixed(0)}",
                        style: precioStyle,
                        ),
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