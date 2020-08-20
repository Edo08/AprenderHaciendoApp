/* import 'package:aprender_haciendo_app/core/models/productModel1.dart';
import 'package:flutter/material.dart';

    class ProductProvider with ChangeNotifier {
      List<Product> _productList=[];
      Product _currentProduct;
      List<Product> _featuredProductList=[];



    //  getter
      List<Product> get productList => _productList;
      List<Product> get featuredProductList => _featuredProductList;
      Product get currentProduct => _currentProduct;


    //  setter
      set productList(List<Product> productList) {
        _productList = productList;
        notifyListeners();
      }

       set currentProduct(Product product) {
        _currentProduct = product;
        notifyListeners();
      }

       addProduct(Product product) {
        _productList.insert(0, product);
        notifyListeners();
      }

      deleteProduct(Product product) {
        _productList.removeWhere((_product) => _product.codigo == product.codigo);
        notifyListeners();
      }

    } */