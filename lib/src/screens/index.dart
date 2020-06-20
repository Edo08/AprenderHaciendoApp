import 'package:aprender_haciendo_app/src/widgets/categoryselector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
class Index extends StatefulWidget {
  static const String routeName = '/index';

  @override
  _IndexState createState() => _IndexState();
}
 
final TextStyle searchBarStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium");
 
class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 1125,
      height: 2436,
      allowFontScaling: true
      )..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(130),
                left: ScreenUtil().setWidth(50),
                right: ScreenUtil().setWidth(50)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                        onTap: () {},
                        child: Image.asset(
                        "icons/icon_menu.png",
                        width: ScreenUtil.getInstance().setWidth(110),
                        height: ScreenUtil.getInstance().setHeight(110),
                      )   
                  ),
                  InkWell(
                        onTap: () {},
                        child: Image.asset(
                        "icons/icon_cart.png",
                        width: ScreenUtil.getInstance().setWidth(130),
                        height: ScreenUtil.getInstance().setHeight(130),
                      )   
                  )
                ],
              ),
            ),
            SizedBox(
              height: 22,
            ),
              Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text("Tienda",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins-Bold",
                fontSize: 26,
                fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.12),
                        offset: Offset(0, 10),
                        blurRadius: 30)
                  ]),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 18, right: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Buscar",
                        hintStyle: searchBarStyle,
                        suffixIcon: Image.asset("icons/icon_search.png",
                        width: ScreenUtil.getInstance().setWidth(20)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
              height: 20,
            ),            
          CategorySelector(
            categorias: ["Preescolar", "Primaria", "Secundaria"],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(50),
          ),
           SizedBox(
            height: ScreenUtil().setHeight(1050),
            /*
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: products.length -1,
              itemBuilder: (context, index){
                Sets kits = products[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(30),
                  ),
                  child: Login(
                    
                  ),
                );
              },
            ),*/
          ),
 
            ],
          ),
        ),
      );
  }
}