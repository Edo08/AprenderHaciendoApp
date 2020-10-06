/*
import 'package:aprender_haciendo_app/core/models/carritoModelDB.dart';
import 'package:aprender_haciendo_app/core/models/orderModelDB.dart';
import 'package:aprender_haciendo_app/core/services/authentication.dart';
import 'package:aprender_haciendo_app/core/services/helpers/compraServices.dart';
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
  Timestamp _fecha;

  String get id => _id;
  String get uid => _uid;
  int get createdAt => _createdAt;
  Timestamp get fecha => _fecha;
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

import 'package:aprender_haciendo_app/core/models/carritoModelDB.dart';
import 'package:aprender_haciendo_app/core/models/orderModelDB.dart';
import 'package:aprender_haciendo_app/core/services/helpers/orderServices.dart';
import 'package:aprender_haciendo_app/core/services/providers/userProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider with ChangeNotifier {
  String collection = "orders";
  Firestore _firestore = Firestore.instance;
  List<OrderModelDB> _order = [];
  OrderServices _orderServices = OrderServices();

  /* OrderProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  } */

  OrderProvider() {
    _getOrdersByUID();
  }

  List<OrderModelDB> get order => _order;

  void createOrder(
      {String uid, String id, List<CarritoModelDB> cart, int total}) {
    List<Map> convertedCart = [];
    for (CarritoModelDB item in cart) {
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

  _getOrdersByUID() async {
    Future<String> uid = UserProvider.initialize().getCurrentUID();
    _order = await _orderServices.getOrdersByUser(uid);
    notifyListeners();
  }
}

 Future<List<OrderItem>> getUserOrders(String userId) async => _firestore
          .collection(collection)
          .where("uid", isEqualTo: userId)
          .getDocuments()
          .then(
        (result) {
          List<OrderItem> orders = [];
          for (DocumentSnapshot order in result.documents) {
            orders.add(OrderItem.fromSnapshot(order));
          }
          return orders;
        },
      ); */

/* Future<void> _onStateChanged(FirebaseUser user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _orderItem = await _compraProvider.getComprasByUID(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  } */
