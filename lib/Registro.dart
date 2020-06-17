import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}
class _RegistroState extends State<Registro> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  TextEditingController nombreCtrl = new TextEditingController();
  TextEditingController apellidosCtrl = new TextEditingController();
  TextEditingController nacimientoCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  TextEditingController repeatPassCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF4cb2e2),
      resizeToAvoidBottomPadding: true,
      appBar: new AppBar(
        title: new Text('Registro'),
        backgroundColor: Color(0xFF4cb2e2),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.all(25.0),
          child: new Form(
            key: keyForm,
            child: formUI(),
          ),
        ),
      ),
    );
  }
  Widget formUI() {
    return Container(
        height: ScreenUtil.getInstance().setHeight(1070),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 15.0),
                  blurRadius: 15.0),
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, -10.0),
                  blurRadius: 10.0),
            ]),
        child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
            child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nombreCtrl,
                    decoration: new InputDecoration(
                      labelText: 'Nombre',
                    ),
                    keyboardType: TextInputType.text,
                    maxLength: 20,),
                  TextFormField(
                    controller: apellidosCtrl,
                    decoration: new InputDecoration(
                      labelText: 'Apellidos',
                    ),
                    keyboardType: TextInputType.text,
                    maxLength: 40,),
                  TextFormField(
                    controller: nacimientoCtrl,
                    decoration: new InputDecoration(
                      labelText: 'Fecha nacimiento',
                    ),
                    keyboardType: TextInputType.datetime,
                    maxLength: 13,),
                  TextFormField(
                    controller: emailCtrl,
                    decoration: new InputDecoration(
                      labelText: 'Correo electrónico',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 50,),
                  TextFormField(
                    controller: passwordCtrl,
                    decoration: new InputDecoration(
                      labelText: 'Contraseña',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 20,),
                  TextFormField(
                    controller: repeatPassCtrl,
                    decoration: new InputDecoration(
                      labelText: 'Confirmar contraseña',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 20,),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(450),
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFF65c6f4),
                                Color(0xFF0074c9)
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Center(
                                child: Text("REGISTRARSE",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 17,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ])
        )
    );
  }
}