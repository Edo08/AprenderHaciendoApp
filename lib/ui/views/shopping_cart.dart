import 'package:aprender_haciendo_app/ui/widgets/cards/cartItem.dart';
import 'package:flutter/material.dart';

final TextStyle nameStyle = TextStyle(
  fontSize: 16,
  fontFamily: "Poppins-Bold",
);
final TextStyle precioStyle = TextStyle(
  fontSize: 16,
  fontFamily: "Muli",
);
final TextStyle totalStyle = TextStyle(
    fontSize: 26, fontFamily: "Poppins-Bold", fontWeight: FontWeight.bold);
final TextStyle subtotalStyle = TextStyle(
  fontSize: 24,
  fontFamily: "Poppins-Bold",
);
final TextStyle subtotalPrecioStyle =
    TextStyle(fontSize: 22, fontFamily: "Muli", fontWeight: FontWeight.bold);
final TextStyle totalprecioStyle =
    TextStyle(fontSize: 24, fontFamily: "Muli", fontWeight: FontWeight.w800);
final TextStyle confirmarStyle =
    TextStyle(fontSize: 16, fontFamily: "Poppins-Medium", color: Colors.white);

GlobalKey<FormState> keyForm = new GlobalKey();
TextEditingController codigoCtrl = new TextEditingController();

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Carrito de compras",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins-Bold",
                    fontSize: 26,
                    fontWeight: FontWeight.w700)),
            Container(

            ),
            CartItem(),
            CartItem(),
            CartItem(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "¿Tiene un cupón de descuento?",
                  style: TextStyle(fontFamily: "Poppins-Medium", fontSize: 14),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Código"),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF65c6f4), Color(0xFF0074c9)]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Aplicar",
                      style: confirmarStyle,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),

/*               Row(
                children: <Widget>[
                  Container(
                  margin: new EdgeInsets.only(top: 0, left: 5.0, right: 80, bottom: 20),
                  child: new Form(
                    key: keyForm,
                    child: formUI(),
                  ),
                ),
                ],
              ), */

            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total",
                  style: totalStyle,
                ),
                Text(
                  "₡" + "1 230 700",
                  style: totalprecioStyle,
                )
              ],
            ),
            Spacer(),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF65c6f4), Color(0xFF0074c9)]),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Confirmar compra",
                  style: confirmarStyle,
                ),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 30.0,
            )
          ],
        ),
      ),
    );
  }
}

Widget formUI() {
  return Container(
      child: Padding(
          padding: EdgeInsets.only(right: 90.0),
          child: Column(children: <Widget>[
            TextFormField(
              style: TextStyle(
                fontFamily: "Poppins-Medium",
              ),
              decoration: new InputDecoration(
                labelText: 'Código',
              ),
              controller: codigoCtrl,
            ),
          ])));
}
