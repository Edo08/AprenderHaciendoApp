
import 'package:aprender_haciendo_app/core/services/authentication.dart';
import 'package:aprender_haciendo_app/noSeUsa/carrito/ordenesModelDB.dart';
import 'package:aprender_haciendo_app/noSeUsa/carrito/orderServices.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider with ChangeNotifier {
  List<OrdernesModelDB> _ordenes = [];
  OrderServices _orderServices= OrderServices();

  OrderProvider() {
    _getComprasByUID();
  }

  //getter
  List<OrdernesModelDB> get ordenes => _ordenes;

  //methods
  void _getComprasByUID() async {
    Future<String> uid = Authentication().getCurrentUID();
    _ordenes = await _orderServices.getComprasByUser(uid);
    notifyListeners();
  }
/* 
  void _getCompras() async {
    _compras = await _compraServices.getCompras();
    notifyListeners();
  }
 */
}
