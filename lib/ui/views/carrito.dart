import 'package:aprender_haciendo_app/core/models/productoModelDB.dart';
import 'package:aprender_haciendo_app/core/services/providers/carritoProvider.dart';
import 'package:aprender_haciendo_app/core/services/providers/orderProvider.dart';
import 'package:aprender_haciendo_app/ui/widgets/bodies/bodyProductoDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final TextStyle nameStyle = TextStyle(fontSize: 16, fontFamily: "Poppins-Bold");
final TextStyle precioStyle =
    TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
final TextStyle totalStyle = TextStyle(
    fontSize: 26, fontFamily: "Poppins-Bold", fontWeight: FontWeight.bold);
final TextStyle subtotalStyle =
    TextStyle(fontSize: 24, fontFamily: "Poppins-Bold");

final TextStyle subtotalPrecioStyle =
    TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

final TextStyle totalprecioStyle =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w800);

final TextStyle confirmarStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Bold", color: Colors.white);
GlobalKey<FormState> keyForm = new GlobalKey();
TextEditingController codigoCtrl = new TextEditingController();
ProductoModelDB product;

class ShoppingCart extends StatefulWidget {
  static const String routeName = '/shopping_cart';
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CarritoProvider>(context);
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
                                        "${cartList[index].image}",
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
                                          /* GestureDetector(
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
                                          ), */
                                          Text(
                                            "Cantidad: ",
                                            style: nameStyle,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: Text(
                                              "${cartList[index].quantity}",
                                              style: nameStyle,
                                            ),
                                          ),
                                          /* GestureDetector(
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
                                          ), */
                                          Spacer(),
                                          Text(
                                            "\₡${(cartList[index].precio * cartList[index].quantity).toStringAsFixed(0)}",
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
                        onDismissed: (direction) async {
                          cart.removeItem(cart.items.keys.toList()[index]);
                          await cart.removeFromCart(cartItem: cartList[index]);
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
            /* Row(
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
                  "\₡${(cart.totalAmount).toStringAsFixed(0)}",
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
              onTap: () {
                Alert(
                  context: context,
                  style: alertStyle,
                  type: AlertType.success,
                  title: "",
                  desc: "Orden de compra generada.",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "ACEPTAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Poppins-Medium"),
                      ),
                      onPressed: () async {
                         /*var uuid = Uuid();
                        String id = uuid.v4();
                        var userId =
                            (await FirebaseAuth.instance.currentUser()).uid;
                        order.createOrder(
                            uid: userId,
                            id: id,
                            total: CarritoProvider().userModel.getTotalPrice(),
                            cart: CarritoProvider().userModel.cart);
                        for (CartItem cartItem
                            in CarritoProvider().userModel.cart) {
                          bool value = await CarritoProvider()
                              .removeFromCart(cartItem: cartItem);
                          if (value) {
                            CarritoProvider().reloadUserModel();
                            print("Item added to cart");
                          } else {
                            print("ITEM WAS NOT REMOVED");
                          } */
                          Navigator.pushNamed(context, '/tienda');
                        //}
                      },
                      width: 120,
                    )
                  ],
                ).show();
              },
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
