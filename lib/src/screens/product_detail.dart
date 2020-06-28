import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
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
)).toList();

final TextStyle barStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium", color: Colors.black);
final TextStyle detailStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium", color: Colors.black);
final TextStyle titleStyle =
    TextStyle(fontSize: 22, fontFamily: "Poppins-Bold", color: Colors.black);

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        ),
    );
  }
}