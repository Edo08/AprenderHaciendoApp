import 'package:aprender_haciendo_app/src/pruebaProductos/productoModel.dart';
import 'package:flutter/material.dart';

    class ProductProvider with ChangeNotifier {
      List<ProductModel> _productList=[];
      ProductModel _currentProduct;
      List<ProductModel> _featuredProductList=[];



    //  getter
      List<ProductModel> get productList => _productList;
      List<ProductModel> get featuredProductList => _featuredProductList;
      ProductModel get currentProduct => _currentProduct;


    //  setter
      set productList(List<ProductModel> productList) {
        _productList = productList;
        notifyListeners();
      }

       set currentProduct(ProductModel product) {
        _currentProduct = product;
        notifyListeners();
      }

       addProduct(ProductModel product) {
        _productList.insert(0, product);
        notifyListeners();
      }

      deleteProduct(ProductModel product) {
        _productList.removeWhere((_product) => _product.id == product.id);
        notifyListeners();
      }

    }
