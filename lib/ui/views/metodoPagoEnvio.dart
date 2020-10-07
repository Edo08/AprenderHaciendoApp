
import 'package:aprender_haciendo_app/core/models/carritoModelDB.dart';
import 'package:aprender_haciendo_app/core/services/helpers/userServices.dart';
import 'package:aprender_haciendo_app/core/services/providers/userProvider.dart';
import 'package:aprender_haciendo_app/ui/views/productoDetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smart_select/smart_select.dart';
import 'package:uuid/uuid.dart';

class MetodoPagoEnvio extends StatefulWidget {
  @override
  _MetodoPagoEnvio createState() => _MetodoPagoEnvio();
}

  final TextStyle confirmarStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Bold", color: Colors.white);
  class _MetodoPagoEnvio extends State<MetodoPagoEnvio> {
  
    String pago = 'metodosPago';
    List<SmartSelectOption<String>> metodos = [
      SmartSelectOption<String>(value: 'Botón de pago', title: 'Botón de pago'),
      SmartSelectOption<String>(value: 'Tranferencia Sinpe', title: 'Tranferencia Sinpe'),
      SmartSelectOption<String>(value: 'Transferencia Sinpe Móvil', title: 'Transferencia Sinpe Móvil (Montos menores a ₡100 000)'),
      SmartSelectOption<String>(value: 'Efectivo', title: 'Efectivo - Pago contra entrega (Dentro del GAM)'),
    ];

    String envio = 'metodosEnvio';
    List<SmartSelectOption<String>> opciones = [
      SmartSelectOption<String>(value: 'Retiro en sucursal', title: 'Retiro en sucursal (Uno de nuestros asesores le proveerá la dirección una vez tramitado el pago)'),
      SmartSelectOption<String>(value: 'Envío a domicilio', title: 'Envío a domicilio (La tarifa de envío es variable según el producto comprado. Uno de nuestros asesores le confirmará el monto de envío)'),
    ];

  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    UserServices userServices = UserServices();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text("Método de pago",style: TextStyle(color: Colors.black,fontFamily: "Poppins-Bold",fontSize: 26,fontWeight: FontWeight.w700)),
          ),
          SizedBox(height: 10),

          SmartSelect<String>.single(
            title: 'Seleccione',
            placeholder: "",
            value: pago,
            options: metodos,
            onChange: (val) => setState(() => pago = val)
          ),
          
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text("Método de entrega",style: TextStyle(color: Colors.black,fontFamily: "Poppins-Bold",fontSize: 26,fontWeight: FontWeight.w700)),
          ),
          SizedBox(height: 10),
          SmartSelect<String>.single(
            title: 'Seleccione',
            placeholder: "", 
            value: envio,
            options: opciones,
            onChange: (val) => setState(() => envio = val)
          ),
          Spacer(),  
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF65c6f4), Color(0xFF0074c9)]),
                  borderRadius: BorderRadius.circular(10)),
              child: Text("Confirmar compra",style: confirmarStyle),
            ),
            onTap: () async {          
              var uuid = Uuid();
                  String id = uuid.v4();
                  var userId = (await FirebaseAuth.instance.currentUser()).uid;
                  var userModel = await userServices.getUserById(userId);
                  user.createOrder(
                      uid: userId,
                      id: id,
                      metPago: pago,
                      metEnvio: envio,
                      cart: userModel.cart, //cart.userModel.cart,
                      total: userModel.totalCartPrice); //cart.userModel.totalCartPrice);
                  user.reloadUserModel();
                  for (CarritoModelDB cartItem in userModel.cart) {
                    bool value = await user.removeFromCart(cartItem: cartItem);
                    if (value) {
                      user.reloadUserModel();
                      print("Item added to cart");
                    } else {
                      print("ITEM WAS NOT REMOVED");
                    } 
                  }
                  Alert(
                    context: context,
                    style: alertStyle,
                    type: AlertType.success,
                    title: "",
                    desc: "Orden de compra generada.",
                    buttons: [
                      DialogButton(
                        child: Text("ACEPTAR", style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: "Poppins-Medium")),
                        onPressed: () {
                          //Navigator.pop(context);
                          Navigator.pushNamed(context, '/index');
                        },
                        width: 120,
                      )
                    ],
                  ).show();

            }, 
          ),
          SizedBox(height: 40),     
          ])
        ),
        );
      }  

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_arrow_left,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),     
    );
  }
}