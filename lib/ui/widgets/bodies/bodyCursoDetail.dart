import 'package:aprender_haciendo_app/core/models/cursosmodel.dart';
import 'package:flutter/material.dart';
import '../add_cart.dart';
import '../product_image.dart';

final TextStyle nombreProductoStyle = TextStyle(
    fontSize: 25,
    fontFamily: "Poppins-Medium",
    color: Colors.black,
    fontWeight: FontWeight.w700);

final TextStyle nombrecantPStyle = TextStyle(
    fontSize: 16,
    fontFamily: "Poppins-Medium",
    color: Colors.lightBlue,
    fontWeight: FontWeight.w700);
final TextStyle cantPiezasStyle = TextStyle(
    fontSize: 16,
    fontFamily: "Poppins-Medium",
    color: Colors.black,
    fontWeight: FontWeight.w500);

final TextStyle descripcionProductoStyle = TextStyle(
    fontSize: 16,
    fontFamily: "Poppins-Medium",
    color: Colors.grey,
    fontWeight: FontWeight.w500);

class BodyCursoDetail extends StatelessWidget {
  final Cursos curso;

  const BodyCursoDetail({Key key, this.curso}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
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
                  Center(
                    child: Hero(
                      tag: '${curso.id}',
                      child: ProductPoster(
                        size: size,
                        image: curso.imagen,
                      ),
                    ),
                  ),
                  //ListOfColors(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                    vertical: 10.0 / 2),
                      child: Center(
                        child: Text(
                        curso.nombre,
                        style: nombreProductoStyle,
                        ),
                      ),                  
                  ),
                  Center(
                    child:Text(
                    "\₡${(curso.precio).toStringAsFixed(0)}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ),                  
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0 / 2, horizontal: 20),
                    child: Text(
                      curso.descripcion,
                      style: descripcionProductoStyle,
                      textAlign: TextAlign.justify,
                    ), 
                  ), 
                  SizedBox(height: 10.0),
                  Row(

                    children: <Widget>[
                    SizedBox(width: 20,),
                    Text(
                      "Modalidad:",
                        style: nombrecantPStyle
                      ),
                    Text(
                      " "+ curso.modalidad,
                      style: cantPiezasStyle
                    ),
                    SizedBox(width: 15,),                  
                    ]            
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                    SizedBox(width: 20,),
                    Text(
                      "Edades:",
                        style: nombrecantPStyle
                      ),
                    Text(
                      " "+ curso.rangoEdad,
                      style: cantPiezasStyle
                    ),]            
                  ),
                  SizedBox(height: 25,), 
                ],
              ),
            ),
            AddToCart(),
          ],
        ),
      ),
    );
  }
}
