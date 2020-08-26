import 'package:aprender_haciendo_app/core/services/providers/carritoProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  static const UID = "uid";
  static const NOMBRE = "nombre";
  static const APELLIDO = "apellido";
  static const EMAIL = "email";
  static const CART = "cart";
  static const TOTALCARTPRICE = "totalCartPrice";

  String _uid;
  String _nombre;
  String _apellido;
  String _email;
  int _priceSum = 0;

//  getters
  String get name => _nombre;
  String get apellido => _apellido;
  String get email => _email;
  String get uid => _uid;

  // public variables
  List<CartItem> cart;
  int totalCartPrice;

  List<CartItem> _convertCartItems(List cart) {
    List<CartItem> convertedCart = [];
    for (Map cartItem in cart) {
      convertedCart.add(CartItem.fromMap(cartItem));
    }
    return convertedCart;
  }

  int getTotalPrice({List cart}) {
    if (cart == null) {
      return 0;
    }
    for (Map cartItem in cart) {
      _priceSum += cartItem["total"];
    }
    int total = _priceSum;
    return total;
  }

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _nombre = snapshot.data[NOMBRE];
    _apellido = snapshot.data[APELLIDO];
    _email = snapshot.data[EMAIL];
    _uid = snapshot.data[UID];
    cart = _convertCartItems(snapshot.data[CART] ?? []);
     /* totalCartPrice = snapshot.data[CART] == null
        ? 0
        : getTotalPrice(cart: snapshot.data[CART]);  */
  }
}
