import 'package:aprender_haciendo_app/src/widgets/product_card.dart';
import 'package:aprender_haciendo_app/src/widgets/category_list.dart';
import 'package:aprender_haciendo_app/src/model/productomodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_launch/flutter_launch.dart';

class Tienda extends StatefulWidget {
  static const String routeName = '/tienda';

  @override
  _TiendaState createState() => _TiendaState();
}

final TextStyle searchBarStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium");
final TextStyle newProductStyle =
    TextStyle(fontSize: 24, fontFamily: "Poppins-Bold", color: Colors.white);
final TextStyle nameProductStyle =
    TextStyle(fontSize: 20, fontFamily: "Poppins-Medium", color: Colors.white);

class _TiendaState extends State<Tienda> {
  /* void whatsAppOpen() async {
    await FlutterLaunch.launchWathsApp(phone: "+50684438017", message: null);
  } */

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(0),
                    left: ScreenUtil().setWidth(50),
                    right: ScreenUtil().setWidth(50)),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Tienda",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins-Bold",
                        fontSize: 26,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: 10,
              ),
              //SearchBox(),
              Categorylist(),

              /* Container(
                height: 60.0,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategorySelector(
                      categorias: [
                        "Preescolar",
                        "Primaria",
                        "Secundaria",
                        "Todos"
                      ],
                    ),
                  ],
                ),
              ), */
             
              SizedBox(
                height: ScreenUtil().setHeight(1050),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Sets sets = products[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(30),
                      ),
                      child: ProductCard(
                        producto: sets,
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                child: Container(
                  height: ScreenUtil().setHeight(425),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(60),
                            vertical: ScreenUtil().setHeight(30)),
                        padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(60),
                          left: ScreenUtil().setWidth(50),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFf29c1f),
                              Color(0xFFf0c419),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Nuevo producto",
                              style: newProductStyle,
                            ),
                            Text(
                              "Spike™ Prime",
                              style: nameProductStyle,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil().setHeight(-75),
                        right: ScreenUtil().setWidth(-50),
                        child: Image.asset(
                          "images/breakdance_spike.png",
                          width: ScreenUtil().setWidth(580),
                          height: ScreenUtil().setHeight(550),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // whatsAppOpen();
          },
          child: Icon(Icons.phone),
          backgroundColor: Colors.green,
        ));
  }
}
