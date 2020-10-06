import 'package:aprender_haciendo_app/core/models/cursosModelDB.dart';
import 'package:aprender_haciendo_app/core/services/providers/userProvider.dart';
import 'package:aprender_haciendo_app/ui/views/carrito.dart';
import 'package:aprender_haciendo_app/ui/widgets/bodies/bodyCursoDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CursoDetail extends StatelessWidget {
  final CursosModelDB curso;

  const CursoDetail({Key key, this.curso}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00a7eb),
      appBar: buildAppBar(context),
      body: BodyCursoDetail(
        curso: curso,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
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
      actions: <Widget>[
        IconButton(
          icon: Image.asset("icons/icon_cart.png", width: 130.0, height: 130.0),
          onPressed: () {
            user.reloadUserModel();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingCart()),
            );
          },
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
