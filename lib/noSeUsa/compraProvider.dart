/* import 'package:aprender_haciendo_app/core/models/orderModelDB.dart';
import 'package:aprender_haciendo_app/core/services/authentication.dart';
import 'package:aprender_haciendo_app/core/services/helpers/compraServices.dart';
import 'package:aprender_haciendo_app/core/services/providers/userProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CompraProvider with ChangeNotifier {
  List<OrderModelDB> _compras = [];
  CompraServices _compraServices = CompraServices();
  Firestore _firestore = Firestore.instance;
  String collection = "orders";


  CompraProvider() {
    getComprasByUID();
  }

  //getter
  List<OrderModelDB> get compras => _compras;

  //methods
  void getComprasByUID() async {
    Future<String> uid = UserProvider.initialize().getCurrentUID();
    _compras = await _compraServices.getComprasByUser(uid);
    notifyListeners();
  }

  Future<OrderModelDB> getOrdersById(String id)=> _firestore.collection(collection).document(id).get().then((doc){
    return OrderModelDB.fromSnapshot(doc);
  });
/* 
  void _getCompras() async {
    _compras = await _compraServices.getCompras();
    notifyListeners();
  }
 */
}
 */