import 'package:aprender_haciendo_app/core/models/productoModelDB.dart';
import 'package:aprender_haciendo_app/core/services/helpers/productoServices.dart';
import 'package:flutter/cupertino.dart';

class ProductoProvider with ChangeNotifier {
  List<ProductoModelDB> _products = [];
  ProductoServices _productServices = ProductoServices();

  ProductoProvider() {
    _getProducts();
  }

  //getter
  List<ProductoModelDB> get products => _products;

  //methods
  void _getProducts() async {
    _products = await _productServices.getProducts();
    notifyListeners();
  }
}
