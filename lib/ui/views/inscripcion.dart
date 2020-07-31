
import 'package:aprender_haciendo_app/core/models/academymodel.dart';
import 'package:aprender_haciendo_app/core/services/validation_mixins.dart';
import 'package:aprender_haciendo_app/ui/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:aprender_haciendo_app/ui/widgets/app_error_message.dart';

class Inscripcion extends StatefulWidget {
final Academys academy;
const Inscripcion({Key key, this.academy}) : super(key: key);
  @override
  _InscripcionState createState() => _InscripcionState();
  
}



class _InscripcionState extends State<Inscripcion> with ValidationMixins {
  final TextStyle barStyle =
    TextStyle(fontFamily: "Poppins-Bold", color: Colors.black);
  final auth = FirebaseAuth.instance;
  final databaseReference = Firestore.instance;
  GlobalKey<FormState> keyForm = new GlobalKey();
  TextEditingController nombreCtrl = new TextEditingController();
  TextEditingController apellidosCtrl = new TextEditingController();
  TextEditingController telCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController domicilioCtrl = new TextEditingController();
  FocusNode _nombreFocus = FocusNode();
  FocusNode _apellidosFocus = FocusNode();
  FocusNode _domicilioFocus = FocusNode();
  FocusNode _telefonoFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _none = FocusNode();
  bool _autoValidate = false;
  bool showSpinner = false;
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  static Pattern patternStr = r'(^[a-zA-Z ]*$)';
  RegExp regExpStr = new RegExp(patternStr);
  static Pattern pattterntel = r'(^[0-9]*$)';
  RegExp regExptel = new RegExp(pattterntel);
  bool isDateSelected = false;
  DateTime fechaNacimiento; // instance of DateTime
  String birthDateInString;
  String _errorMessage = "";

  void setSpinnerStatus(bool status) {
    setState(() {
      showSpinner = status;
    });
  }

  @override
  void initState() {
    super.initState();
    nombreCtrl = TextEditingController();
    apellidosCtrl = TextEditingController();
    domicilioCtrl = TextEditingController();
    telCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    _nombreFocus = FocusNode();
    _apellidosFocus = FocusNode();
    _domicilioFocus = FocusNode();
    _telefonoFocus = FocusNode();
    _emailFocus = FocusNode();
    _none = FocusNode();
  }

 @override
  void dispose() {
    super.dispose();
    nombreCtrl.dispose();
    apellidosCtrl.dispose();
    domicilioCtrl.dispose();
    telCtrl.dispose();
    emailCtrl.dispose();
    _nombreFocus.dispose();
    _apellidosFocus.dispose();
    _domicilioFocus.dispose();
    _telefonoFocus.dispose();
    _emailFocus.dispose();
    _none.dispose();
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return ErrorMessage(errorMessage: _errorMessage);
    } else {
      return Container(
        height: 0.0,
      );
    }
  }

 /*  _registrarse() async {
    if (keyForm.currentState.validate()) {
      try {
        var auth = await Authentication().createUser(email: emailCtrl.text, password: passwordCtrl.text);
        if (auth.success) {
          Navigator.pushNamed(context, '/index');
          createRecord();
        } else {
          print(auth.errorMessage);
          setState(() {
            _errorMessage = auth.errorMessage;
          });
        }
      } catch (e) {
        print(e);
      }
    } else {
      setState(() => _autoValidate = true);
    }
  } */

   void borrarInscripcion() {
    nombreCtrl.text = "";
    apellidosCtrl.text = "";
    telCtrl.text = "";
    emailCtrl.text = "";
    domicilioCtrl.text = "";
  }

  void createRecord() async {
    var userId = (await FirebaseAuth.instance.currentUser()).uid;
    var ref = databaseReference.collection("users").document("$userId");
    await ref.setData({
      'uid': '$userId',
      'nombre': '${nombreCtrl.text}',
      'apellido': '${apellidosCtrl.text}',
      'domicilio': '${domicilioCtrl.text}',
      'telefono': '${telCtrl.text}',
      'email': '${emailCtrl.text}'
    });
    borrarInscripcion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Inscripción",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins-Bold",
                    fontSize: 26,
                    fontWeight: FontWeight.w700)
            ),
          new Form(
            key: keyForm,
            child: formUI(),
          ),
          ]
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
            ),
        child: Scaffold(
            body: ModalProgressHUD(
                inAsyncCall: showSpinner,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
                        child: Column(                         
                          children: <Widget>[                           
                            _nombreField(),
                            Sized22,
                            _apellidosField(),
                            Sized22,
                            _telefonoField(),
                            Sized22,
                            _emailField(),
                            Sized22,
                            _domicilioField(),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20),
                            ),
                            _showErrorMessage(),
                            Sized22,
                            _submitButton(),
                            Sized22
                          ],
                        ))))));
  }

  Widget _nombreField() {
    return TextFormField(
      style: TextStyle(fontFamily: "Poppins-Medium",),
      autovalidate: _autoValidate,
      controller: nombreCtrl,
      decoration: new InputDecoration(
        labelText: 'Nombre',
      ),
      focusNode: _nombreFocus,
      onFieldSubmitted: (value) {
        _fieldFocusChange(context, _nombreFocus, _apellidosFocus);
      },
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        nombreCtrl = value as TextEditingController;
      },
      validator: validateNombre,
    );
  }

  Widget _apellidosField() {
    return TextFormField(
      style: TextStyle(fontFamily: "Poppins-Medium",),
      autovalidate: _autoValidate,
      controller: apellidosCtrl,
      decoration: new InputDecoration(
        labelText: 'Apellidos',
      ),
      focusNode: _apellidosFocus,
      onFieldSubmitted: (value) {
        _fieldFocusChange(context, _apellidosFocus, _none);
      },
      keyboardType: TextInputType.text,
      onChanged: (value) {
        apellidosCtrl = value as TextEditingController;
      },
      validator: validateApellidos,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _telefonoField() {
    return TextFormField(
      style: TextStyle(fontFamily: "Poppins-Medium",),
      autovalidate: _autoValidate,
      controller: telCtrl,
      decoration: new InputDecoration(
        labelText: 'Teléfono',
      ),
      focusNode: _telefonoFocus,
      onFieldSubmitted: (value) {
        _fieldFocusChange(context, _telefonoFocus, _emailFocus);
      },
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        telCtrl = value as TextEditingController;
      },
      validator: validateTelefono,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _emailField() {
    return TextFormField(
      style: TextStyle(fontFamily: "Poppins-Medium",),
      autovalidate: _autoValidate,
        controller: emailCtrl,
        decoration: new InputDecoration(
          labelText: 'Correo electrónico',
        ),
        focusNode: _emailFocus,
        onFieldSubmitted: (value) {
          _fieldFocusChange(context, _emailFocus, _none);
        },
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          emailCtrl = value as TextEditingController;
        },
        validator: validateEmail,
        textInputAction: TextInputAction.next);
  }

Widget _domicilioField() {
    return TextFormField(
      style: TextStyle(fontFamily: "Poppins-Medium",),
      autovalidate: _autoValidate,
      controller: domicilioCtrl,
      decoration: new InputDecoration(
        labelText: 'Domicilio',
      ),
      focusNode: _domicilioFocus,
      onFieldSubmitted: (value) {
        _fieldFocusChange(context, _domicilioFocus, _apellidosFocus);
      },
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        domicilioCtrl = value as TextEditingController;
      },
      //validator: validateNombre,
    );
  }

  

  Widget _submitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          child: Container(
            width: ScreenUtil.getInstance().setWidth(450),
            height: ScreenUtil.getInstance().setHeight(100),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFd10100), Color(0xFFfe4936)]),
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
                onTap: () async {
                  setSpinnerStatus(true);
                  //await _registrarse();
                  setSpinnerStatus(false);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 12.0, bottom: 20.0),
                  child: Center(
                    child: Text("INSCRIBIRSE",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins-Bold",
                            fontSize: 17,
                            letterSpacing: 1.0)),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
