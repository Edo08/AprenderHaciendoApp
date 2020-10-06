import 'package:aprender_haciendo_app/core/models/productoModelDB.dart';
import 'package:aprender_haciendo_app/core/services/providers/userProvider.dart';
import 'package:aprender_haciendo_app/ui/widgets/addCarrito.dart';
import 'package:aprender_haciendo_app/ui/widgets/productoImage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final TextStyle nombreProductoStyle = TextStyle(
    fontSize: 25,
    fontFamily: "Poppins-Medium",
    color: Colors.black,
    fontWeight: FontWeight.w700);

final TextStyle nombrecantPStyle = TextStyle(
    fontSize: 16,
    fontFamily: "Poppins-Medium",
    color: Colors.lightBlue,
    fontWeight: FontWeight.w700);
final TextStyle cantPiezasStyle = TextStyle(
    fontSize: 16,
    fontFamily: "Poppins-Medium",
    color: Colors.grey,
    fontWeight: FontWeight.w500);

final TextStyle descripcionProductoStyle = TextStyle(
    fontSize: 16,
    fontFamily: "Poppins-Medium",
    color: Colors.grey,
    fontWeight: FontWeight.w500);
var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop, 
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins-Medium"),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
    );

class BodyProductDetail extends StatelessWidget {
  final ProductoModelDB product;

  _onAlertButton(context) {
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.success,
      title: "", 
      desc: "Producto agregado al carrito con éxito.",
      buttons: [
        DialogButton(
          child: Text(
            "ACEPTAR",
            style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Poppins-Medium"),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  const BodyProductDetail({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    final cart = Provider.of<UserProvider>(context, listen: false);

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: '${product.codigo}',
                      child: ProductPoster(
                        size: size,
                        image: product.image,
                      ),
                    ),
                  ),
                  //ListOfColors(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                    vertical: 10.0 / 2),
                      child: Center(
                        child: Text(
                        product.nombre,
                        style: nombreProductoStyle,
                        textAlign: TextAlign.center,
                        ),
                      ),                  
                  ),
                  Center(
                    child:Text(
                    "\₡${(product.precio).toStringAsFixed(0)}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ),                  
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0 / 2, horizontal: 20),
                    child: Text(
                      product.descripcion,
                      style: descripcionProductoStyle,
                      textAlign: TextAlign.justify,
                    ), 
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                    SizedBox(width: 20,), 
                    Text(
                      "Cantidad de piezas:",
                        style: nombrecantPStyle
                      ),
                    Text(
                      " "+ "${product.cantPiezas.toString()}",
                      style: cantPiezasStyle
                    ),
                    SizedBox(width: 15,),                  
                    ]            
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                    SizedBox(width: 20,),
                    Text(
                      "Edades:",
                        style: nombrecantPStyle
                      ),
                    Text(
                      " "+ product.edades,
                      style: cantPiezasStyle
                    ),]            
                  ),
                  SizedBox(height: 25,), 
                ],
              ),
            ),
            AddToCart(
              press: () { 
                _onAlertButton(context);
                cart.addItem(product.codigo, product.precio, product.image, product.nombre);
                cart.reloadUserModel();
              },
            ),
          ],
        ),
      ),
    );
  }
}
