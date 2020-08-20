/* import 'package:aprender_haciendo_app/core/models/ProductModelDB.dart';
import 'package:aprender_haciendo_app/core/services/helpers/productServices.dart';
import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  List<ProductModelDB> _products = [];
  ProductServices _productServices = ProductServices();

  AppProvider() {
    _getProducts();
  }

  //getter
  List<ProductModelDB> get products => _products;

  //methods
  void _getProducts() async {
    _products = await _productServices.getProducts();
    notifyListeners();
  }
} */
