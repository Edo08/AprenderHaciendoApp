import 'package:aprender_haciendo_app/core/services/authentication.dart';
import 'package:aprender_haciendo_app/core/services/helpers/compraServices.dart';
import 'package:aprender_haciendo_app/core/services/providers/orderProvider.dart';
import 'package:flutter/cupertino.dart';

class CompraProvider with ChangeNotifier {
  List<OrderItem> _compras = [];
  CompraServices _compraServices = CompraServices();

  CompraProvider() {
    _getComprasByUID();
  }

  //getter
  List<OrderItem> get compras => _compras;

  //methods
  void _getComprasByUID() async {
    Future<String> uid = Authentication().getCurrentUID();
    _compras = await _compraServices.getComprasByUser(uid);
    notifyListeners();
  }
/* 
  void _getCompras() async {
    _compras = await _compraServices.getCompras();
    notifyListeners();
  }
 */
}
