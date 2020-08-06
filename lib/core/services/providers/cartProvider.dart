import 'package:flutter/material.dart';

class CartItem {
  final String codigo;
  final String nombre;
  final String imagen2;
  final int quantity;
  final double precio;

  CartItem({
    @required this.codigo,
    @required this.nombre,
    this.imagen2,
    @required this.quantity,
    @required this.precio,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total = total + cartItem.precio * cartItem.quantity;
    });
    return total;
  }

  void addItem(String codigo, double precio, String imagen2, String nombre) {
    if (_items.containsKey(codigo)) {
      _items.update(
          codigo,
          (existing) => CartItem(
                codigo: existing.codigo,
                precio: existing.precio,
                imagen2: existing.imagen2,
                quantity: existing.quantity + 1,
                nombre: existing.nombre,
              ));
      print("$nombre is added to cart multiple");
    } else {
      _items.putIfAbsent(
          codigo,
          () => CartItem(
                codigo: DateTime.now().toString(),
                precio: precio,
                imagen2: imagen2,
                quantity: 1,
                nombre: nombre,
              ));
      print("$nombre is added to cart");
    }
    notifyListeners();
  }

  void removeItem(String codigo) {
    _items.remove(codigo);
    notifyListeners();
  }

  void removeOneItem(String codigo) {
    _items.remove(codigo);
    notifyListeners();
  }

  void addOneItem(String codigo, double precio, String imagen2, String nombre) {
    addItem(codigo, precio, imagen2, nombre);
    notifyListeners();
  }
}
