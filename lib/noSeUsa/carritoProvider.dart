/* 
import 'package:aprender_haciendo_app/core/models/userModelDB.dart';
import 'package:aprender_haciendo_app/core/services/helpers/userServices.dart';
import 'package:aprender_haciendo_app/core/services/providers/orderProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartItem {
  static const ID = "id";
  static const CODIGO = "codigo";
  static const NOMBRE = "nombre";
  static const IMAGE = "image";
  static const PRECIO = "precio";

  String id;
  String codigo;
  String nombre;
  String image;
  int quantity;
  int precio;

  CartItem({
    @required this.codigo,
    @required this.nombre,
    @required this.image,
    @required this.quantity,
    @required this.precio,
  });

/*   String _id;
  String _codigo;
  String _nombre;
  String _image;
  int _precio; */

  CartItem.fromMap(Map data) {
    id = data[ID];
    nombre = data[NOMBRE];
    image = data[IMAGE];
    codigo = data[CODIGO];
    precio = data[PRECIO];
  }

  Map toMap() => {
        ID: id,
        IMAGE: image,
        NOMBRE: nombre,
        CODIGO: codigo,
        PRECIO: precio,
      };
}

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class CarritoProvider with ChangeNotifier {
  UserServices _userServices = UserServices();
  FirebaseAuth _auth;
  FirebaseUser _user;
  Map<String, CartItem> _items = {};
  List<OrderItem> orders = [];
  UserModel _userModel;

  Status _status = Status.Uninitialized;

  CarritoProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  UserModel get userModel => _userModel;

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, cartItem) {
      total = total + cartItem.precio * cartItem.quantity;
    });
    return total;
  }
  

  void addItem(String codigo, int precio, String image, String nombre) async {
    try {
      var userId = (await FirebaseAuth.instance.currentUser()).uid;
      _userModel = await _userServices.getUserById(userId);
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      Map cartItem = {
        "id": cartItemId,
        "nombre": nombre,
        "image": image,
        "codigo": codigo,
        "precio": precio,
      };
      CartItem item = CartItem.fromMap(cartItem);
      _userServices.addToCart(userId: userId, cartItem: item);
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
    } catch (e) {
      print("The error ${e.toString()}");
      notifyListeners();
    }
  }

  Future<bool> removeFromCart({CartItem cartItem}) async {
    print("THE PRODUC IS: ${cartItem.toString()}, ${cartItem.nombre}");
    var userId = (await FirebaseAuth.instance.currentUser()).uid;
    try {
      _userServices.removeFromCart(userId: userId, cartItem: cartItem);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
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

/*   void getOrders() async {
    var userId = (await FirebaseAuth.instance.currentUser()).uid;
    orders = await OrderProvider().getUserOrders(userId: userId);
    notifyListeners();
  } */

  Future<void> reloadUserModel() async {
    var userId = (await FirebaseAuth.instance.currentUser()).uid;
    _userModel = await _userServices.getUserById(userId);
    notifyListeners();
  }

  Future<void> _onStateChanged(FirebaseUser user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}
 */