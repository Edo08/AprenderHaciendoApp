import 'dart:async';
import 'package:aprender_haciendo_app/core/models/productModel.dart';
import 'package:aprender_haciendo_app/core/services/api.dart';
import 'package:aprender_haciendo_app/src/basuraCreo/locator.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModel extends ChangeNotifier {
  Api _api = locator<Api>();

  List<Product> products;


  Future<List<Product>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents.map((doc) => 
    Product.fromMap(doc.data)).toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Product> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Product.fromMap(doc.data) ;
  }

  Future<Product> getProductByCode(String code) async {
    var doc = await _api.getDocumentById(code);
    return  Product.fromMap(doc.data) ;
  }

  Future removeProduct(String code) async{
     await _api.removeDocument(code) ;
     return ;
  }

  Future updateProduct(Product data,String code) async{
    await _api.updateDocument(data.toJson(), code) ;
    return ;
  }

  /* Future addProduct(Product data) async{
    var result = await _api.addDocument(data.toJson()) ;
    return ;
  } */

}