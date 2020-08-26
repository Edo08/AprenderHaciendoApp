import 'dart:async';
import 'package:aprender_haciendo_app/noSeUsa/carrito/carritoItemModel.dart';
import 'package:aprender_haciendo_app/noSeUsa/carrito/userModelDB.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices{
  Firestore _firestore = Firestore.instance;
  String collection = "users";

  void createUser(Map data) {
    _firestore.collection(collection).document(data["uid"]).setData(data);
  }

  Future<UserModel> getUserById(String id)=> _firestore.collection(collection).document(id).get().then((doc){
    return UserModel.fromSnapshot(doc);
  });

  void addToCart({String userId, CarritoItemModel cartItem}){
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CarritoItemModel cartItem}){
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}