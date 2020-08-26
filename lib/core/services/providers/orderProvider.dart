import 'package:aprender_haciendo_app/core/services/providers/carritoProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderItem {
  static const ID = "id";
  static const CART = "cart";
  static const UID = "uid";
  static const TOTAL = "total";
  static const FECHA = "fecha";
  static const CREATEDAT = "createdAt";

  String _id;
  String _uid;
  int _createdAt;
  int _total;
  DateTime _fecha;

  String get id => _id;
  String get uid => _uid;
  int get createdAt => _createdAt;
  DateTime get fecha => _fecha;
  int get total => _total;

  List cart;

  OrderItem.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _uid = snapshot.data[UID];
    _createdAt = snapshot.data[CREATEDAT];
    _fecha = snapshot.data[FECHA];
    _total = snapshot.data[TOTAL];
    cart = snapshot.data[CART];
  }
}

class OrderProvider with ChangeNotifier {
  String collection = "orders";
  Firestore _firestore = Firestore.instance;
  List<OrderItem> convertedCart = [];

  void createOrder({String uid, String id, List<CartItem> cart, int total}) {
    List<Map> convertedCart = [];
    for (CartItem item in cart) {
      convertedCart.add(item.toMap());
    }
    _firestore.collection(collection).document(id).setData({
      "uid": uid,
      "id": id,
      "fecha": DateTime.now(),
      "cart": convertedCart,
      "total": total,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
    });
  }

  Future<List<OrderItem>> getUserOrders({String userId}) async => _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<OrderItem> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrderItem.fromSnapshot(order));
        }
        return orders;
      });
}
