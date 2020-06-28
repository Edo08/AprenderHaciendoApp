import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuedateEnCasa extends StatelessWidget {
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body:      
      SingleChildScrollView(    
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[           
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(0),
                left: ScreenUtil().setWidth(50),
                right: ScreenUtil().setWidth(50)
              ),
            ),
            SizedBox(
              height: 10,
            ),
              Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Quédate en casa",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins-Bold",
                fontSize: 26,
                fontWeight: FontWeight.w700)),
            ),
        
        ])
      )
    );
  }
}