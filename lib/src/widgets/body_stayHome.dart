import 'package:aprender_haciendo_app/src/model/productomodel.dart';
import 'package:aprender_haciendo_app/src/widgets/horizontal_card.dart';
import 'package:aprender_haciendo_app/src/widgets/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyStayHome extends StatelessWidget {
  
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
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text("Mantener la educación emocionante y atractiva en casa puede ser difícil. Estamos aquí para hacerlo un poco más fácil con algunos recursos para apoyar el proceso de aprendizaje en el hogar.",
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
          //poner cuadro explicando que es quedate en casa
          SizedBox(height: 10),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                    )                  ),
                ),
                ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => HorizontalCard(
                    itemIndex: index,
                    producto: products[index],
                    press: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail()));
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