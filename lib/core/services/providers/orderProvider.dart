import 'package:aprender_haciendo_app/core/services/providers/carritoProvider.dart';
import 'package:flutter/material.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> orderedProducts;
  final DateTime datetime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.orderedProducts,
    @required this.datetime,
  });
}

class Oders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOder(List<CartItem> cartProducts, double total) {
    _orders.add(
      OrderItem(
        amount: total,
        datetime: DateTime.now(),
        id: DateTime.now().toString(),
        orderedProducts: cartProducts,
      ),
    );
    notifyListeners();
  }

  void clearAll() {
    _orders = [];
    notifyListeners();
  }
}
