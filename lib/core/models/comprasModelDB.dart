import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ComprasModelDB with ChangeNotifier {
  static const TRANSACTIONCODE = "transactionCode";
  static const FECHA = "fecha";
  static const CANTIDAD = "cantidad";
  static const NOMBREPRODUCTO = "nombreProducto";
  static const PRECIO = "precio";
  static const TOTAL = "total";
  static const UID = "uid";

  int _transactionCode;
  Timestamp _fecha;
  int _cantidad;
  String _nombreProducto;
  int _precio;
  int _total;
  String _uid;

  int get transactionCode => _transactionCode;
  Timestamp get fecha => _fecha;
  int get cantidad => _cantidad;
  String get nombreProducto => _nombreProducto;
  int get precio => _precio;
  int get total => _total;
  String get uid => _uid; 
  
  // public variable
  bool liked = false;

  ComprasModelDB.fromSnapshot(DocumentSnapshot snapshot) {

    _transactionCode = snapshot.data[TRANSACTIONCODE];
    _fecha = snapshot.data[FECHA];
    _cantidad = snapshot.data[CANTIDAD];
    _nombreProducto = snapshot.data[NOMBREPRODUCTO];
    _precio = snapshot.data[PRECIO].floor();
    _total = snapshot.data[TOTAL];
    _uid = snapshot.data[UID];

  }
}
