import 'package:aprender_haciendo_app/core/models/comprasModelDB.dart';
import 'package:aprender_haciendo_app/core/services/authentication.dart';
import 'package:aprender_haciendo_app/core/services/helpers/compraServices.dart';
import 'package:flutter/cupertino.dart';

class CompraProvider with ChangeNotifier {
  List<ComprasModelDB> _compras = [];
  CompraServices _compraServices = CompraServices();

  CompraProvider() {
    _getComprasByUID();
  }

  //getter
  List<ComprasModelDB> get compras => _compras;

  //methods
  void _getComprasByUID() async {
    Future<String> uid = Authentication().getCurrentUID();
    _compras = await _compraServices.getProductsByUser(uid);
    notifyListeners();
  }
/* 
  void _getCompras() async {
    _compras = await _compraServices.getCompras();
    notifyListeners();
  }
 */
}
