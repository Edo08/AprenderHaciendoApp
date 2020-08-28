import 'package:aprender_haciendo_app/core/services/providers/orderProvider.dart';
import 'package:aprender_haciendo_app/ui/widgets/bodies/bodyHistorialDetail.dart';
import 'package:flutter/material.dart';

class HistorialDetail extends StatelessWidget {
  final OrderItem historial;

  const HistorialDetail({Key key, this.historial}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00a7eb),
      appBar: buildAppBar(context),
      body: BodyHistorialDetail(
        historial: historial,
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
