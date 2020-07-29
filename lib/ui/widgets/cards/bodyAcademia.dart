
import 'package:aprender_haciendo_app/core/models/academymodel.dart';
import 'package:aprender_haciendo_app/ui/widgets/cards/academy_card.dart';
import 'package:flutter/material.dart';

class BodyAcademia extends StatelessWidget {
  
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
                child: Text("Únete a la Comunidad LEGO® Education Academy de Costa Rica",
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
                child: Text("Y abre tus puertas al mundo STEAM con soluciones LEGO® Education.",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins-Medium",
                        fontSize: 17,
                        fontWeight: FontWeight.w200)),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text("Certificaciones disponibles:",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins-Bold",
                        fontSize: 22,
                        fontWeight: FontWeight.w200)),
              ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Color(0xFFffd403),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                    )                  ),
                ),
                ListView.builder(
                  itemCount: certificaciones.length,
                  itemBuilder: (context, index) => AcademyCard(
                    itemIndex: index,
                    certificacion: certificaciones[index],
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