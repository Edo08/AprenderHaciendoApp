import 'package:flutter/material.dart';

class CartItem {
  final String codigo;
  final String nombre;
  final String image;
  final int quantity;
  final int precio;

  CartItem({
    @required this.codigo,
    @required this.nombre,
    @required this.image,
    @required this.quantity,
    @required this.precio,
  });
}

class CarritoProvider with ChangeNotifier {
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

  void addItem(String codigo, int precio, String image, String nombre) {
    if (_items.containsKey(codigo)) {
      _items.update(
        codigo,
        (existing) => CartItem(
          codigo: existing.codigo,
          precio: existing.precio,
          image: existing.image,
          quantity: existing.quantity + 1,
          nombre: existing.nombre,
        ),
      );
      print("$nombre is added to cart multiple");
    } else {
      _items.putIfAbsent(
          codigo,
          () => CartItem(
                codigo: DateTime.now().toString(),
                precio: precio,
                image: image,
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

  void addOneItem(String codigo, int precio, String image, String nombre) {
    addItem(codigo, precio, image, nombre);
    notifyListeners();
  }
}
