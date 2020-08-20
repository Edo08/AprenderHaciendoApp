import 'package:aprender_haciendo_app/core/models/eventosModelDB.dart';
import 'package:aprender_haciendo_app/ui/widgets/bodies/bodyEventoDetail.dart';
import 'package:flutter/material.dart';

class EventosDetail extends StatelessWidget {
  final EventosModelDB evento;

  const EventosDetail({Key key, this.evento}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd10100),
      appBar: buildAppBar(context),
      body: BodyEventoDetail(
        evento: evento,
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



