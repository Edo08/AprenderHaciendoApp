// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:carousel_slider/carousel_options.dart';

import 'package:flutter/material.dart';


/* final List<String> imgList = [
  'https://www.robot-advance.com/EN/ori-lego-education-spike-prime-set-45678-2468.jpg',
  'https://www.robotix.es/1007-thickbox_default/lego-education-spike-prime.jpg',
  'https://le-www-live-s.legocdn.com/sc/media/images/newvi/spike-prime/45680_prod_spike_prime_expansion_competition_ready_assemblinganadvanceddrivingbase_08_withdoodles-bca1425c61dcd0afb059595eb8065002.png',
];

final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),     
      child: Stack(
        children: <Widget>[
          Image.network(item, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
          ),
        ],
      )
    ),
  ),
)).toList(); */

final TextStyle barStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium", color: Colors.black);
final TextStyle detailStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium", color: Colors.black);
final TextStyle titleStyle =
    TextStyle(fontSize: 22, fontFamily: "Poppins-Bold", color: Colors.black);
final TextStyle shopStyle =
    TextStyle(fontSize: 22, fontFamily: "Poppins-Bold", color: Colors.white);

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xFF65c6f4),
                              Color(0xFF0074c9)
                            ],begin: Alignment.topCenter,
                              end: Alignment.bottomLeft)
                            ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                  ))
              ],
            )),
            Container(
              margin: EdgeInsets.only(top: 30),
              child:Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios), onPressed: (){
                      Navigator.pop(context);
                      })
                  ],
                ),
              )
            ),
            Container(
              margin: EdgeInsets.only(top:50),
              padding: EdgeInsets.only(left: 30, right: 30),
              child:Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: 1,
                  child: Image.asset("images/lego-spike.png"),
                )
                
            )
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 120,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0,1),
                                blurRadius: 25,
                                ),
                                ],
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 90,  
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xFF65c6f4),
                              Color(0xFF0074c9)
                            ]),
                            borderRadius: BorderRadius.circular(20)),
                      child: Text("Comprar", style: shopStyle,),
                    )
                  ],
                ),             
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                  topRight: Radius.circular(40))
                ),

              ),
            ),
          ],
        ),
      );
  }
}
      /* appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Detalle del producto',
          style: barStyle),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,),
      body: Container(
        child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20.0)),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
          SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( "Spike Prime",
                  style: titleStyle,
            ),
          ]),
          
            Text( "Código: ",
                  style: detailStyle,
            ),
            Text( "Cantidad de piezas: ",
                  style: detailStyle,
            ),
            Text( "Precio: ",
                  style: detailStyle,
            ),
            Text( "Descripción: ",
                  style: detailStyle,
            ),
          ],
          ),
        ), */

