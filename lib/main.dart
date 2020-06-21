import 'package:aprender_haciendo_app/src/screens/index.dart';
import 'package:aprender_haciendo_app/src/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:aprender_haciendo_app/src/screens/welcome_screen.dart';
import 'package:aprender_haciendo_app/src/screens/registro.dart';


void main() {
  runApp(
    MaterialApp(
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
    )
  );
} 
