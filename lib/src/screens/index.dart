import 'package:aprender_haciendo_app/src/screens/contacto.dart';
import 'package:aprender_haciendo_app/src/screens/historial_compras.dart';
import 'package:aprender_haciendo_app/src/screens/product_card.dart';
import 'package:aprender_haciendo_app/src/widgets/categoryselector.dart';
import 'package:aprender_haciendo_app/src/model/productomodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
 
class Index extends StatefulWidget {
  static const String routeName = '/index';

  @override
  _IndexState createState() => _IndexState();
}
 
final TextStyle searchBarStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium");
 
class _IndexState extends State<Index> {

  List<ScreenHiddenDrawer> items = new List();

  @override
  void initState() {
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Historial de compras",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.teal,
        ),
        Historial_compras()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Contacto",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.orange,
        ),
        Contacto()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Cerrar Sesión",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.orange,
        ),
        Contacto()));

    super.initState();
  }

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
                        onTap: () {
                          return HiddenDrawerMenu(
                            //backgroundColorMenu: Colors.blueGrey,
                            //backgroundColorAppBar: Colors.cyan,
                            screens: items,
                              //    typeOpen: TypeOpen.FROM_RIGHT,
                              //    enableScaleAnimin: true,
                              //    enableCornerAnimin: true,
                              slidePercent: 70.0,
                              //    verticalScalePercent: 80.0,
                              contentCornerRadius: 40.0,
                              //    iconMenuAppBar: Icon(Icons.menu),
                              //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
                              //    whithAutoTittleName: true,
                              //    styleAutoTittleName: TextStyle(color: Colors.red),
                              //    actionsAppBar: <Widget>[],
                              //    backgroundColorContent: Colors.blue,
                              //    elevationAppBar: 4.0,
                              //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
                              //    enableShadowItensMenu: true,
                              //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
                          ); 
                        },
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