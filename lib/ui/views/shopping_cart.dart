import 'package:aprender_haciendo_app/core/models/cursosmodel.dart';
import 'package:aprender_haciendo_app/core/models/productModel.dart';
import 'package:aprender_haciendo_app/core/services/providers/cartProvider.dart';
import 'package:aprender_haciendo_app/ui/views/curso_detail.dart';
import 'package:aprender_haciendo_app/ui/widgets/cards/cartItem.dart';
import 'package:aprender_haciendo_app/ui/widgets/cards/cursos_card.dart';
import 'package:aprender_haciendo_app/ui/widgets/cards/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final TextStyle nameStyle = TextStyle(fontSize: 16, fontFamily: "Poppins-Bold");
final TextStyle precioStyle = TextStyle(fontSize: 16, fontFamily: "Muli");
final TextStyle totalStyle = TextStyle(
    fontSize: 26, fontFamily: "Poppins-Bold", fontWeight: FontWeight.bold);
final TextStyle subtotalStyle =
    TextStyle(fontSize: 24, fontFamily: "Poppins-Bold");
final TextStyle subtotalPrecioStyle =
    TextStyle(fontSize: 22, fontFamily: "Muli", fontWeight: FontWeight.bold);
final TextStyle totalprecioStyle =
    TextStyle(fontSize: 24, fontFamily: "Muli", fontWeight: FontWeight.w800);
final TextStyle confirmarStyle =
    TextStyle(fontSize: 16, fontFamily: "Poppins-Medium", color: Colors.white);
GlobalKey<FormState> keyForm = new GlobalKey();
TextEditingController codigoCtrl = new TextEditingController();
ProductModel product;

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartList = cart.items.values.toList();

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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Carrito de compras",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins-Bold",
                  fontSize: 26,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              width: 400,
              height: 400,
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 110,
                                      height: 110,
                                      padding: EdgeInsets.all(4.0),
                                      child: Image.network(
                                        "${cartList[index].imagen2}",
                                        fit: BoxFit.contain,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF65a6f4),
                                              Color(0xFF25cfff)
                                            ],
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0, 8),
                                            blurRadius: 8,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 160,
                                        child: Text(
                                          "${cartList[index].nombre}",
                                          style: nameStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          GestureDetector(
                                            child: Container(
                                              width: 20.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF0074c9),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                            onTap: () {},
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: Text(
                                              "${cartList[index].quantity}",
                                              style: nameStyle,
                                            ),
                                          ),
                                          GestureDetector(
                                            child: Container(
                                              width: 20.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF65c6f4),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                            onTap: () {},
                                          ),
                                          Spacer(),
                                          Text(
                                            "₡" + "${cartList[index].precio}",
                                            style: precioStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        key: ValueKey(cart.items.keys.toList()[index]),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          cart.removeItem(cart.items.keys.toList()[index]);
                        },
                        background: Container(
                          padding: EdgeInsets.only(right: 20),
                          color: Theme.of(context).errorColor,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
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
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total",
                  style: totalStyle,
                ),
                Text(
                  "₡" + "${cart.totalAmount}",
                  style: totalprecioStyle,
                ),
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
            ),
          ],
        ),
      ),
    );
  }
}

/* Widget formUI() {
  return Container(
    child: Padding(
      padding: EdgeInsets.only(right: 90.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            style: TextStyle(
              fontFamily: "Poppins-Medium",
            ),
            decoration: new InputDecoration(
              labelText: 'Código',
            ),
            controller: codigoCtrl,
          ),
        ],
      ),
    ),
  );
}
 */
