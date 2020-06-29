import 'package:aprender_haciendo_app/src/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//ultimo 

class Registro extends StatefulWidget {
  static const String routeName = '/registro';

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final auth = FirebaseAuth.instance;
  final databaseReference = Firestore.instance;

  GlobalKey<FormState> keyForm = new GlobalKey();

  TextEditingController nombreCtrl = new TextEditingController();
  TextEditingController apellidosCtrl = new TextEditingController();
  TextEditingController nacimientoCtrl = new TextEditingController();
  TextEditingController telCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  TextEditingController repeatPassCtrl = new TextEditingController();
  
  final FocusNode _nombreFocus = FocusNode();  
  final FocusNode _apellidosFocus = FocusNode();  
  final FocusNode _nacimientoFocus = FocusNode();
  final FocusNode _telefonoFocus = FocusNode();  
  final FocusNode _emailFocus = FocusNode();  
  final FocusNode _passFocus = FocusNode();
  final FocusNode _reppassFocus = FocusNode();
  final FocusNode _none = FocusNode();
  
  static Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  static Pattern patternStr = r'(^[a-zA-Z ]*$)';
  RegExp regExpStr = new RegExp(patternStr);
  static Pattern pattterntel = r'(^[0-9]*$)';
  RegExp regExptel = new RegExp(pattterntel);
  
  bool isDateSelected= false;
  DateTime fechaNacimiento; // instance of DateTime
  String birthDateInString;

  //String _email; // guion bajo es para que sea interna
  //String _password;
  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);  
  }

  _registrarse() async{
    if (keyForm.currentState.validate()) {      
      try{
        var newUser = await Authentication().createUser(email: emailCtrl.text, password: passwordCtrl.text);
        if (newUser != null){
          Navigator.pushNamed(context, '/index');
          createRecord(); 
                  
        }        
      }catch (e){
        print(e);
      }  
    }
  }

void createRecord() async {
  await databaseReference.collection("users")
    .document()
    .setData({
      'nombre': '${nombreCtrl.text}',
      'apellido': '${apellidosCtrl.text}',
      'fechaNacimiento': '$fechaNacimiento',
      'telefono': '${telCtrl.text}',
      'email': '${emailCtrl.text}',
      'contraseña': '${passwordCtrl.text}'
    }
  );
}

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
                  focusNode: _nombreFocus,
                  onFieldSubmitted: (value){
                    _fieldFocusChange(context, _nombreFocus, _apellidosFocus);
                  },
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onChanged: (value){
                    nombreCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (value.length == 0) {
                      return "El nombre es necesario";
                    /* } else if (!regExpStr.hasMatch(value)) {
                      return "El nombre debe de ser a-z y A-Z"; */
                    } else if (value.isEmpty) {
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
                  focusNode: _apellidosFocus,
                  onFieldSubmitted: (value){
                    _fieldFocusChange(context, _apellidosFocus, _none );
                  }, 
                  keyboardType: TextInputType.text,
                  onChanged: (value){
                    apellidosCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (value.length == 0) {
                      return "Los apellidos son necesario";
                    /* } else if (!regExpStr.hasMatch(value)) {
                      return "El apellido debe de ser a-z y A-Z"; */
                    } else if (value.isEmpty) {
                      return 'Por favor ingrese sus Apellidos';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 22,
                ),

                TextFormField(
                  controller: nacimientoCtrl,
                  decoration: new InputDecoration(
                    labelText: 'Fecha nacimiento',
                  ),
                  focusNode: _nacimientoFocus,
                  onFieldSubmitted: (value){
                    _fieldFocusChange(context, _nacimientoFocus, _telefonoFocus);
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese su Fecha de nacimiento';
                    }
                    return null;
                  },
                  onTap: ()async{
                    final datePick= await showDatePicker(
                      
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime(1900),
                      lastDate: new DateTime(2100)
                    );
                    if(datePick!=null && datePick!=fechaNacimiento){
                      setState(() {
                        fechaNacimiento=datePick;
                        isDateSelected=true;
                        nacimientoCtrl.text = "${fechaNacimiento.day}/${fechaNacimiento.month}/${fechaNacimiento.year}"; 
                      });
                    }
                     new Text(isDateSelected ? "$fechaNacimiento":"Seleccione su fecha de nacimiento");
                  }
                  
                /*   onChanged: (value){
                    nacimientoCtrl = value as TextEditingController;
                  },
                   
                  textInputAction: TextInputAction.next,*/
                ),
                SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: telCtrl,
                  decoration: new InputDecoration(
                    labelText: 'Telefono',
                  ),
                  focusNode: _telefonoFocus,
                  onFieldSubmitted: (value){
                    _fieldFocusChange(context, _telefonoFocus, _emailFocus);
                  },
                  keyboardType: TextInputType.phone,
                  onChanged: (value){
                    telCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese su telefono';
                    } else if (!regExptel.hasMatch(value))
                      return 'Su numero de telefono debe tener 8 digitos';
                    else 
                      return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: emailCtrl,
                  decoration: new InputDecoration(
                    labelText: 'Correo electrónico',
                  ),
                  focusNode: _emailFocus,
                  onFieldSubmitted: (value){
                    _fieldFocusChange(context, _emailFocus, _passFocus);
                  },
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value){
                    emailCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor un Email';
                    } else if (!regex.hasMatch(value))
                      return 'Ingrese un Email Valido';
                    else
                      return null;
                  },
                  textInputAction: TextInputAction.next                            
                ),
                SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: passwordCtrl,
                  obscureText: true,
                  decoration: new InputDecoration(
                    labelText: 'Contraseña',
                  ),
                  focusNode: _passFocus,
                  onFieldSubmitted: (value){
                    _fieldFocusChange(context, _passFocus, _reppassFocus);
                  },
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value){
                    passwordCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese la contraseña';
                    } else if (value.length < 6) {
                      return 'Contraseña tiene que ser mayor de 6 caracteres';
                    } return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: repeatPassCtrl,
                  obscureText: true,
                  decoration: new InputDecoration(
                    labelText: 'Confirmar contraseña',
                  ),
                  focusNode: _reppassFocus,
                  onFieldSubmitted: (value){
                    _reppassFocus.unfocus();
                    _registrarse(); //aqui va la accion de registrarse;
                  },
                  
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value){
                    repeatPassCtrl = value as TextEditingController;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese la contraseña';
                    } else if(value != passwordCtrl.text){
                      return 'Las contraseñas no coinciden';
                    } 
                    return null;
                  },
                  textInputAction: TextInputAction.next,
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
                               _registrarse();
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



