import 'package:aprender_haciendo_app/src/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Login extends StatelessWidget {
  static const String routeName = '/login';
 
  final FocusNode _userFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();
  final focusNode = FocusNode();
  String _email;
  String _password;


  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);  
  }


  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(620),
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
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Usuario",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(30))),
            
            TextField(
              focusNode: _userFocus,
                onSubmitted: (value){
                  _fieldFocusChange(context, _userFocus, _passFocus);
                },
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)
              ),
              textInputAction: TextInputAction.next,
              onChanged: (value){_email = value;},
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Contraseña",
              style: TextStyle(
                fontFamily: "Poppins-Medium",
                fontSize: ScreenUtil.getInstance().setSp(30)
              )
            ),
            TextField(
              obscureText: true,
              focusNode: _passFocus,
                onSubmitted: (term){
                  _passFocus.unfocus();
                  focusNode.unfocus();
                },
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              textInputAction: TextInputAction.next,
              onChanged: (value){_password = value;},                        
              ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(40)
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: Container(
                    width: ScreenUtil.getInstance().setWidth(580),
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
                          blurRadius: 8.0
                        )
                      ]
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          var user = await Authentication().loginUser(email: _email, password: _password);
                          if(user!= null){
                            Navigator.pushNamed(context, '/index');
                            print('$_email y $_password');
                          } 
                          print('$_email y $_password');
                        },
                        
                        child: Center(
                          child: Text("INGRESAR",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins-Bold",
                              fontSize: 18,
                              letterSpacing: 1.0
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            ),
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "¿Olvidó la contraseña?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(28)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}