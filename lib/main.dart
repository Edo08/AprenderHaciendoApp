import 'package:aprender_haciendo_app/core/services/providers/academyProvider.dart';
import 'package:aprender_haciendo_app/core/services/providers/compraProvider.dart';
import 'package:aprender_haciendo_app/core/services/providers/cursoProvider.dart';
import 'package:aprender_haciendo_app/core/services/providers/eventoProvider.dart';
import 'package:aprender_haciendo_app/core/services/providers/orderProvider.dart';
import 'package:aprender_haciendo_app/core/services/providers/paqueteProvider.dart';
import 'package:aprender_haciendo_app/core/services/providers/productoProvider.dart';
import 'package:aprender_haciendo_app/core/services/providers/userProvider.dart';
import 'package:aprender_haciendo_app/ui/views/academia.dart';
import 'package:aprender_haciendo_app/ui/views/carrito.dart';
import 'package:aprender_haciendo_app/ui/views/index.dart';
import 'package:aprender_haciendo_app/ui/views/login.dart';
import 'package:aprender_haciendo_app/ui/views/registro.dart';
import 'package:aprender_haciendo_app/ui/views/splash.dart';
import 'package:aprender_haciendo_app/ui/views/tienda.dart';
import 'package:aprender_haciendo_app/ui/views/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: AcademyProvider()),
        ChangeNotifierProvider.value(value: ProductoProvider()),
        ChangeNotifierProvider.value(value: CursoProvider()),
        ChangeNotifierProvider.value(value: EventoProvider()),
        ChangeNotifierProvider.value(value: PaqueteProvider()),
        ChangeNotifierProvider.value(value: OrderProvider()),
        ChangeNotifierProvider.value(value: CompraProvider()),
      ],
      child: MaterialApp(
        home: ScreensController(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: TextTheme()),
        //initialRoute: WelcomeScreen.routeName,
        routes: <String, WidgetBuilder>{
          Login.routeName: (BuildContext context) => Login(),
          WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
          Registro.routeName: (BuildContext context) => Registro(),
          Index.routeName: (BuildContext context) => Index(),
          Academia.routeName: (BuildContext context) => Academia(),
          Tienda.routeName: (BuildContext context) => Tienda(),
          ShoppingCart.routeName: (BuildContext context) => ShoppingCart(),
        }, 
      ),
    );
  }
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return WelcomeScreen();
      case Status.Authenticated:
        return Tienda();
      default:
        return WelcomeScreen();
    }
  }
}
