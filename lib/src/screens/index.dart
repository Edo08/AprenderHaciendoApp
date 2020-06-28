import 'package:aprender_haciendo_app/src/screens/academia.dart';
import 'package:aprender_haciendo_app/src/screens/cursos.dart';
import 'package:aprender_haciendo_app/src/screens/eventos.dart';
import 'package:aprender_haciendo_app/src/screens/historial_compras.dart';
import 'package:aprender_haciendo_app/src/screens/quedateEnCasa.dart';
import 'package:aprender_haciendo_app/src/screens/tienda.dart';
import 'package:aprender_haciendo_app/src/services/authentication.dart';
import 'package:aprender_haciendo_app/src/widgets/profileClipper.dart';
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
          name: "Quédate en casa",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8),
           fontSize: 20.0,fontFamily: "Poppins-Medium"),
          colorLineSelected: Colors.white,
        ),
        QuedateEnCasa()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Academia",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8),
           fontSize: 20.0,fontFamily: "Poppins-Medium"),
          colorLineSelected: Colors.white,
        ),
        Academia()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Eventos",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8),
           fontSize: 20.0,fontFamily: "Poppins-Medium"),
          colorLineSelected: Colors.white,
        ),
        Eventos()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Cursos",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8),
           fontSize: 20.0,fontFamily: "Poppins-Medium"),
          colorLineSelected: Colors.white,
        ),
        Cursos()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Historial compras",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8),
           fontSize: 20.0,fontFamily: "Poppins-Medium"),
          colorLineSelected: Colors.white,
        ),
        HistorialCompras()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Cerrar Sesión",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8), 
          fontSize: 20.0,fontFamily: "Poppins-Medium"),
          colorLineSelected: Colors.white10,
          onTap: (){Authentication().singOut();
                    signOutGoogle(); 
                    Navigator.pushNamed(context, '/welcomeScreen');
                },         
        ),       
        null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    makeProfileAvatar(); // no funciona, aqui deberia salir el usuario
    
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
          ClipOval(
            clipper: ProfileClipper(),
            child: Image.asset("images/lego_M.jpg",
            width: ScreenUtil().setWidth(160),
            height: ScreenUtil().setHeight(160),
            fit: BoxFit.fill,),
          ),
          
          SizedBox(
<<<<<<< HEAD
            width: 10,
          )
        ],                        
=======
            width: 15,
          ),
        ],
        
                                
>>>>>>> cbd9592... Version 1.23
          //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
          //    backgroundColorContent: Colors.blue,
          //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
          //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      );
    
  }

  
  makeProfileAvatar() {
    child: Column(
      children: <Widget>[
        // SizedBox(height: 10.0),
        CircleAvatar(
          radius: 60.0,
          backgroundImage: new AssetImage("icons/018-lego.png"),
        ),
        SizedBox(height: 20.0),
        Center(
          child: new Text("Usuario",
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        Center(
          child: new Text("Correo",
              style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.white70,
                  fontWeight: FontWeight.normal)),
        )
      ],
    );
  }


}