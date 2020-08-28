/* import 'package:aprender_haciendo_app/noSeUsa/carrito/carritoItemModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const UID = "uid";
  static const NOMBRE = "nombre";
  static const APELLIDO = "apellido";
  static const TELEFONO = "telefono";
  static const EMAIL = "email";
  static const PASSWORD = "password";
  static const FECHANACIMIENTO = "fechaNacimiento";
  static const CART = "cart";

  String _uid;
  String _nombre;
  String _apellido;
  String _telefono;
  String _email;
  String _password;
  DateTime _fechaNacimiento;
  double _priceSum = 0.00;

//  getters
  String get uid => _uid;
  String get nombre => _nombre;
  String get apellido => _apellido;
  String get telefono => _telefono;
  String get email => _email;
  String get password => _password;
  DateTime get fechaNacimiento => _fechaNacimiento;

  // public variables
  List<CarritoItemModel> cart;
  double totalCartPrice;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _uid = snapshot.data[UID];
    _nombre = snapshot.data[NOMBRE];
    _apellido = snapshot.data[APELLIDO];
    _email = snapshot.data[EMAIL];
    _telefono = snapshot.data[TELEFONO];
    _fechaNacimiento = snapshot.data[FECHANACIMIENTO];
    cart = _convertCartItems(snapshot.data[CART] ?? []);
    totalCartPrice = snapshot.data[CART] == null
        ? 0
        : getTotalPrice(cart: snapshot.data[CART]);
  }

  List<CarritoItemModel> _convertCartItems(List cart) {
    List<CarritoItemModel> convertedCart = [];
    for (Map cartItem in cart) {
      convertedCart.add(CarritoItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }

  double getTotalPrice({List cart}) {
    if (cart == null) {
      return 0.00;
    }
    for (Map cartItem in cart) {
      _priceSum += cartItem["precio"];
    }
    double total = _priceSum;
    return total;
  }
}
 */