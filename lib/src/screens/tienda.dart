import 'package:aprender_haciendo_app/src/screens/product_card.dart';
import 'package:aprender_haciendo_app/src/widgets/categoryselector.dart';
import 'package:aprender_haciendo_app/src/model/productomodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 
class Tienda extends StatefulWidget {
  static const String routeName = '/tienda';

  @override
  _TiendaState createState() => _TiendaState();
}
 
final TextStyle searchBarStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium");
 
class _TiendaState extends State<Tienda> {

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
                top: ScreenUtil().setHeight(0),
                left: ScreenUtil().setWidth(50),
                right: ScreenUtil().setWidth(50)
              ),

            ),
            SizedBox(
              height: 22,
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
              height: 20,
            ),                              
          SizedBox(            
            height: ScreenUtil().setHeight(1050),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index){
                Sets sets = products[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(30),
                  ),
                  child: ProductCard(
                    sets: sets,
                    cardNum: index,
                  ),
                );
              },
            ),
          ),
          ],
        ),
      ),
    ); 

    
  }
}

