/* import 'dart:async';
import 'package:aprender_haciendo_app/core/models/productoModelDB.dart';
import 'package:aprender_haciendo_app/noSeUsa/carrito/carritoItemModel.dart';
import 'package:aprender_haciendo_app/noSeUsa/carrito/ordenesModelDB.dart';
import 'package:aprender_haciendo_app/noSeUsa/carrito/orderServices.dart';
import 'package:aprender_haciendo_app/noSeUsa/carrito/userModelDB.dart';
import 'package:aprender_haciendo_app/noSeUsa/carrito/userServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  //final _auth = FirebaseAuth.instance;
  /* Stream<String> get onAuthStateChanged => _auth.onAuthStateChanged.map(
    (FirebaseUser user) => user?.uid,); */
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();

  UserModel _userModel;

  //  getter
  UserModel get userModel => _userModel;
  Status get status => _status;
  FirebaseUser get user => _user;

  // public variables
  List<OrdernesModelDB> orders = [];

  /* Future<void> _onStateChanged(FirebaseUser user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }  */

  Future<bool> addToCart({ProductoModelDB producto}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<CarritoItemModel> cart = _userModel.cart;

      Map cartItem = {
        "id": cartItemId,
        "codigo": producto.codigo,
        "nombre": producto.nombre,
        "image": producto.image,
        //"cantidad": ,
        "price": producto.precio,
      };

      CarritoItemModel item = CarritoItemModel.fromMap(cartItem);
      //      if(!itemExists){
      print("CART ITEMS ARE: ${cart.toString()}");
      _userServices.addToCart(userId: _user.uid, cartItem: item);
      //      }

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> removeFromCart({CarritoItemModel cartItem}) async {
    print("THE PRODUC IS: ${cartItem.toString()}");
    try {
      _userServices.removeFromCart(userId: _user.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }

  void removeItem(String codigo) {
    orders.remove(codigo);
    notifyListeners();
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  /* 
  Future<AuthenticationRequest> loginUser(
      {String email = "", String password = ""}) async {
    AuthenticationRequest authRequest = AuthenticationRequest();
    try {
      _status = Status.Authenticating;
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        authRequest.success = true;
      }
    } catch (e) {
      _mapErrorMessage(authRequest, e.code);
    }
    return authRequest;
  }

  // Email & Password Sign Up
  Future<AuthenticationRequest> createUser(
      String nombre,
      String apellido,
      String telefono,
      String email,
      String password,
      DateTime fechaNacimiento) async {
    AuthenticationRequest authRequest = AuthenticationRequest();
    try {
      _status = Status.Authenticating;
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      /* 
          .then(
        (user) {
          _userServices.createUser(
            {
              'nombre': nombre,
              'apellido': apellido,
              'telefono': telefono,
              'email': email,
              'password': password,
              'uid': user.user.uid,

            },
          );
        },
      ); */
      if (user != null) {
        authRequest.success = true;
      }
    } catch (e) {
      _mapErrorMessage(authRequest, e.code);
      _status = Status.Unauthenticated;
      print(e.toString());
    }
    return authRequest;
  }

  // GET UID
  Future<String> getCurrentUID() async {
    try {
      return (await _auth.currentUser()).uid;
    } catch (e) {
      print(e);
    }
    return null;
  }

  // GET CURRENT USER
  Future<FirebaseUser> getCurrentUser() async {
    try {
      return await _auth.currentUser();
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _status = Status.Unauthenticated;
      return Future.delayed(Duration.zero);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
    return null;
  }
 */
}
/* 
void _mapErrorMessage(AuthenticationRequest authRequest, String code) {
  switch (code) {
    case 'ERROR_USER_NOT_FOUND':
      authRequest.errorMessage = "Usuario no encontrado";
      break;
    case 'ERROR_WRONG_PASSWORD':
      authRequest.errorMessage = "Contraseña invalida";
      break;
    case 'ERROR_NETWORK_REQUEST_FAIL':
      authRequest.errorMessage = "Error de Red";
      break;
    case 'ERROR_EMAIL_ALREADY_IN_USE':
      authRequest.errorMessage = "Usuario ya registrado";
      break;
    default:
      authRequest.errorMessage = code;
  }
}
 */ */