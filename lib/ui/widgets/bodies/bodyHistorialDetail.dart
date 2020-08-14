
import 'package:aprender_haciendo_app/core/models/historialmodel.dart';
import 'package:flutter/material.dart';

final TextStyle numOrdenStyle = TextStyle(
    fontSize: 25,
    fontFamily: "Poppins-Medium",
    color: Colors.black,
    fontWeight: FontWeight.w700);

final TextStyle tituloStyle = TextStyle(
    fontSize: 20,
    fontFamily: "Poppins-Medium",
    color: Colors.black,
    fontWeight: FontWeight.w500);

final TextStyle descripcionProductoStyle = TextStyle(
    fontSize: 20,
    fontFamily: "Poppins-Medium",
    color: Colors.grey,
    fontWeight: FontWeight.w500);

final TextStyle montoStyle = TextStyle(
    fontSize: 20,
    color: Colors.grey,
    fontWeight: FontWeight.w500);

class BodyHistorialDetail extends StatelessWidget {
  final Historial historial;

  

  const BodyHistorialDetail({Key key, this.historial}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    //Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //ListOfColors(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                    vertical: 10.0 / 2),
                      child: Center(
                        child: Text(
                        "Número de orden "+historial.numOrden,
                        style: numOrdenStyle,
                        textAlign: TextAlign.center,
                        ),
                      ),                  
                  ),                  
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0 / 2, horizontal: 12),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                        Text(
                          "Fecha: ",
                            style: tituloStyle
                          ),
                        Text(
                          historial.fecha,
                          style: descripcionProductoStyle,
                        ),
                        SizedBox(width: 15,),                  
                        ]            
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                    SizedBox(width: 20,),
                    Text(
                      "Monto: ",
                      style: tituloStyle
                    ),
                    Text(
                      "₡"+ "137670",
                      style: montoStyle
                    )]            
                  ),
                  SizedBox(height: 25,), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}