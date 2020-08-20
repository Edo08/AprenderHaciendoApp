import 'package:aprender_haciendo_app/core/services/providers/paqueteProvider.dart';
import 'package:aprender_haciendo_app/ui/views/paquetesDetail.dart';
import 'package:aprender_haciendo_app/ui/widgets/cards/paquetesCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyStayHome extends StatelessWidget {
  final TextStyle newProductStyle =
      TextStyle(fontSize: 24, fontFamily: "Poppins-Bold", color: Colors.white);
  final TextStyle nameProductStyle = TextStyle(
      fontSize: 20, fontFamily: "Poppins-Medium", color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final paquetes = Provider.of<PaqueteProvider>(context);
    final paquetesList = paquetes.paquetes;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
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
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 20),
            child: Text(
                "Mantener la educación emocionante y atractiva en casa puede ser difícil. Estamos aquí para hacerlo un poco más fácil con algunos recursos para apoyar el proceso de aprendizaje en el hogar.",
                textAlign: TextAlign.justify,
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
            child: Text("Productos disponibles:",
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
                        topRight: Radius.circular(40))),
              ),
              ListView.builder(
                itemCount: paquetesList.length,
                itemBuilder: (context, index) => PaquetesCard(
                  itemIndex: index,
                  paquete: paquetesList[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PackDetail(
                          paquete: paquetesList[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
