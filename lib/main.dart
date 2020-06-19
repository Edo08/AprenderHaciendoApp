import 'package:aprender_haciendo_app/screens/Registro.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login.dart';


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
        Registro.routeName: (BuildContext context) => Registro()
      }
    )
  );
} 
