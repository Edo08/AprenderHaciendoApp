
import 'package:aprender_haciendo_app/src/model/eventosmodel.dart';
import 'package:aprender_haciendo_app/src/widgets/eventosCard.dart';
import 'package:flutter/material.dart';

class BodyEventos extends StatelessWidget {
  
final TextStyle newProductStyle =
    TextStyle(fontSize: 24, fontFamily: "Poppins-Bold", color: Colors.white);
final TextStyle nameProductStyle =
    TextStyle(fontSize: 20, fontFamily: "Poppins-Medium", color: Colors.white);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text("Eventos",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins-Bold",
                        fontSize: 26,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text("Inscríbase y participe en los mejores eventos de robótica a nivel nacional e internacionalmente.",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins-Medium",
                        fontSize: 17,
                        fontWeight: FontWeight.w200)),
              ),
              SizedBox(
                height: 10,
              ),
              
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Color(0xFFd10100),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                    )                  ),
                ),
                ListView.builder(
                  itemCount: eventos.length,
                  itemBuilder: (context, index) => EventosCard(
                    itemIndex: index,
                    evento: eventos[index],
                    press: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail()));
                    },
                  )), 
              ],
            )
          ),
        ],
      ),
    );
  }
}