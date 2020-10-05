import 'dart:async';
import 'package:aprender_haciendo_app/core/models/carritoModelDB.dart';
import 'package:aprender_haciendo_app/core/models/userModelDB.dart';
import 'package:aprender_haciendo_app/core/services/helpers/userServices.dart';
import 'package:aprender_haciendo_app/core/services/providers/orderProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  Map<String, CarritoModelDB> _items = {};
  UserModel _userModel;

//  getter
  UserModel get userModel => _userModel;
  Status get status => _status;
  FirebaseUser get user => _user;
  //List<UserModel> _userinfo = [];

  // public variables
  List<OrderItem> orders = [];


  /* UserProvider() {
    UserProvider.initialize();
  }  */

  UserProvider.initialize(): _auth = FirebaseAuth.instance{
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }
  
  Future<void> _onStateChanged(FirebaseUser firebaseUser) async{
    if(firebaseUser == null){
      _status = Status.Unauthenticated;
    }else{
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(user.uid);
    }
    notifyListeners();
  }

  /*
  void _getUser() async {
    var userId = (await FirebaseAuth.instance.currentUser()).uid;
    _userModel = await _userServices.getUserById(userId);
    notifyListeners();
  }

   getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  } */

  Future<void> reloadUserModel() async {
    var userId = (await FirebaseAuth.instance.currentUser()).uid;
    _userModel = await _userServices.getUserById(userId);//user.uid
    notifyListeners();
  }

  Map<String, CarritoModelDB> get items {
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
      CarritoModelDB item = CarritoModelDB.fromMap(cartItem);
      _userServices.addToCart(userId: userId, cartItem: item);
      if (_items.containsKey(codigo)) {
        _items.update(
          codigo,
          (existing) => CarritoModelDB(
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
            () => CarritoModelDB(
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

  Future<bool> removeFromCart({CarritoModelDB cartItem}) async {
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




}
