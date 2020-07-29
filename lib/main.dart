import 'package:aprender_haciendo_app/core/services/providers/categoryProvider.dart';
import 'package:aprender_haciendo_app/core/services/providers/productProvider.dart';
import 'package:aprender_haciendo_app/ui/views/index.dart';
import 'package:aprender_haciendo_app/ui/views/login.dart';
import 'package:aprender_haciendo_app/ui/views/registro.dart';
import 'package:aprender_haciendo_app/ui/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /* MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
    child: */ MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
        )
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: <String, WidgetBuilder>{
        Login.routeName: (BuildContext context) => Login(),
        WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
        Registro.routeName: (BuildContext context) => Registro(),
        Index.routeName: (BuildContext context) => Index()
      }
   // ),
    ),
  );
} 
