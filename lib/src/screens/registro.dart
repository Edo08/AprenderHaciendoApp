import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Registro extends StatefulWidget {
  static const String routeName = '/registro';

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  TextEditingController nombreCtrl = new TextEditingController();
  TextEditingController apellidosCtrl = new TextEditingController();
  TextEditingController nacimientoCtrl = new TextEditingController();
  TextEditingController telCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  TextEditingController repeatPassCtrl = new TextEditingController();


  static Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    bool _autovalidate = false;




  //String _email; // guion bajo es para que sea interna
  //String _password;

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
            ]
        ),
        child:SingleChildScrollView(
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
                  onChanged: (value){
                    nombreCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese su Nombre';
                    }
                    return null;
                  },
                  
                ),
                SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: apellidosCtrl,
                  decoration: new InputDecoration(
                    labelText: 'Apellidos',
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (value){
                    apellidosCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese sus Apellidos';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: nacimientoCtrl,
                  decoration: new InputDecoration(
                    labelText: 'Fecha nacimiento',
                  ),
                  keyboardType: TextInputType.datetime,
                  onChanged: (value){
                    nacimientoCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese su Fecha de nacimiento';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: telCtrl,
                  decoration: new InputDecoration(
                    labelText: 'Telefono',
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (value){
                    telCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese su Nombre';
                    } else if (value.length != 8)
                      return 'Su numero de telefono debe tener 8 digitos';
                    else 
                      return null;
                  },
                ),
                SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: emailCtrl,
                  decoration: new InputDecoration(
                    labelText: 'Correo electrónico',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value){
                    emailCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (!regex.hasMatch(value))
                      return 'Ingrese un Email Valido';
                    else
                      return null;
                  }            
                ),
                SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: passwordCtrl,
                  decoration: new InputDecoration(
                  labelText: 'Contraseña',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value){
                    passwordCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese la contraseña';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: repeatPassCtrl,
                  decoration: new InputDecoration(
                    labelText: 'Confirmar contraseña',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value){
                    repeatPassCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese la contraseña';
                    }
                    return null;
                  },
                ),
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
                            onTap: () {
                              if (keyForm.currentState.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                print ("${emailCtrl.text}");
                                /*
                                Scaffold
                                  .of(context)
                                  .showSnackBar(SnackBar(content: Text('Procesando información')));
                                */
                              }
                            },                          
                            child: Padding(
                            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 20.0),            
                              child: Center(
                                child: Text("REGISTRARSE",
                                  style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 17,
                                        letterSpacing: 1.0
                                  )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
              ])
            )
          )
    );
  }
}