import 'package:aprender_haciendo_app/noSeUsa/carrito/carritoItemModel.dart';
import 'package:aprender_haciendo_app/noSeUsa/carrito/ordenesModelDB.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderServices{
  String collection = "orders";
  Firestore _firestore = Firestore.instance;

  void createOrder({String uid, String transactionCode, String status ,
                    List<CarritoItemModel> cart, int total}) {
    List<Map> convertedCart = [];

    for(CarritoItemModel item in cart){
      convertedCart.add(item.toMap());
    }

    _firestore.collection(collection).document(transactionCode).setData({
      "uid": uid,
      "transactionCode": transactionCode,
      "cart": convertedCart,
      "total": total,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "status": status
    });
  }

  Future<List<OrdernesModelDB>> getUserOrders({String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<OrdernesModelDB> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrdernesModelDB.fromSnapshot(order));
        }
        return orders;
      });

  Future<List<OrdernesModelDB>> getComprasByUser(Future<String> uid) async =>
      _firestore
          .collection(collection)
          .where ("uid", isEqualTo:await  uid)
          .getDocuments()
          .then((result) {
        List<OrdernesModelDB> compras = [];
        for (DocumentSnapshot compra in result.documents) {
          compras.add(OrdernesModelDB.fromSnapshot(compra));
        }
        return compras;
      },);
}