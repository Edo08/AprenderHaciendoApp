import 'package:aprender_haciendo_app/src/widgets/body_stayHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuedateEnCasa extends StatelessWidget {
  
final TextStyle newProductStyle =
    TextStyle(fontSize: 24, fontFamily: "Poppins-Bold", color: Colors.white);
final TextStyle nameProductStyle =
    TextStyle(fontSize: 20, fontFamily: "Poppins-Medium", color: Colors.white);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyStayHome(),
    );
  }
}