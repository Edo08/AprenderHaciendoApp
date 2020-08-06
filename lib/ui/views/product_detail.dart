

import 'package:aprender_haciendo_app/core/models/productModel.dart';
import 'package:aprender_haciendo_app/core/models/productomodel.dart';
import 'package:aprender_haciendo_app/ui/views/shopping_cart.dart';
import 'package:aprender_haciendo_app/ui/widgets/bodies/bodyProductDetail.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel kit;

  const ProductDetail({Key key, this.kit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00a7eb),
      appBar: buildAppBar(context),
      body: BodyProductDetail(
        product: kit,
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
      actions: <Widget>[
        IconButton(
            icon: Image.asset("icons/icon_cart.png",
                width: 130.0,
                height: 130.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingCart()),
              );
            }),
            SizedBox(
              width: 15,
            )
      ],
    );
  }
}



