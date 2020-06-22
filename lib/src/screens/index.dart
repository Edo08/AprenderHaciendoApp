import 'package:aprender_haciendo_app/src/screens/contacto.dart';
import 'package:aprender_haciendo_app/src/screens/historial_compras.dart';
import 'package:aprender_haciendo_app/src/screens/tienda.dart';
import 'package:aprender_haciendo_app/src/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';

import '../../sign_in.dart';


class Index extends StatefulWidget {
  static const String routeName = '/index';

  @override
  _IndexState createState() => _IndexState();
}
 
final TextStyle menuStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium");
 
class _IndexState extends State<Index> {

  List<ScreenHiddenDrawer> items = new List();

  @override
  void initState() {
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Tienda",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8), 
                                fontSize: 20.0,fontFamily: "Poppins-Medium"),
          colorLineSelected: Colors.white,
        ),
        Tienda()));


    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Historial de compras",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8),
           fontSize: 20.0,fontFamily: "Poppins-Medium"),
          colorLineSelected: Colors.white,
        ),
        Historial_compras()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Contacto",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8), 
          fontSize: 20.0,fontFamily: "Poppins-Medium"),
          colorLineSelected: Colors.white,
        ),
        Contacto()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Cerrar Sesión",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8), 
          fontSize: 20.0,fontFamily: "Poppins-Medium"),
          colorLineSelected: Colors.white10,
          onTap: (){Authentication().singOut();
                    signOutGoogle(); 
                    Navigator.pop(context);
                },
                


          /* IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () {
                Authentication().singOut();
                  signOutGoogle(); 
                  Navigator.pop(context);
              }
          ), */
          
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

      return HiddenDrawerMenu(
        backgroundColorMenu: Colors.lightBlue,
        backgroundColorAppBar: Colors.white,
        elevationAppBar: 0.0,
        screens: items,
        //    typeOpen: TypeOpen.FROM_RIGHT,
        //    enableScaleAnimin: true,
        //    enableCornerAnimin: true,
        slidePercent: 65.0,
        verticalScalePercent: 85.0,
        contentCornerRadius: 40.0,
        iconMenuAppBar:
          // Padding(padding : EdgeInsets.only(left: 50)),
        (Image.asset("icons/icon_menu.png",
                  width: ScreenUtil.getInstance().setWidth(110),
                  height: ScreenUtil.getInstance().setHeight(110)
          )
        ),
        actionsAppBar: <Widget>[
          IconButton(icon: Image.asset("icons/icon_cart.png", 
          width: ScreenUtil.getInstance().setWidth(130),
          height: ScreenUtil.getInstance().setHeight(130)), 
          onPressed: null),
          SizedBox(
            width: 15,
          )
        ],
          
          /*  Image.asset(
                    "icons/icon_cart.png",
                    width: ScreenUtil.getInstance().setWidth(130),
                    height: ScreenUtil.getInstance().setHeight(130),
          )
            */
                        
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
      
  }
}