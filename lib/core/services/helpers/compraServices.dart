import 'package:aprender_haciendo_app/core/models/carritoModelDB.dart';
import 'package:aprender_haciendo_app/core/services/providers/orderProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompraServices {
  String collection = "orders";
  Firestore _firestore = Firestore.instance;

  Future<List<OrderItem>> getCompras() async =>
      _firestore.collection(collection).getDocuments().then(
        (result) {
          List<OrderItem> compras = [];
          for (DocumentSnapshot compra in result.documents) {
            compras.add(OrderItem.fromSnapshot(compra));
          }
          return compras;
        },
      );

  Future<List<OrderItem>> getComprasByUser(Future<String> uid) async =>
      _firestore
          .collection(collection)
          .where ("uid", isEqualTo:await uid)
          .getDocuments()
          .then((result) {
        List<OrderItem> compras = [];
        for (DocumentSnapshot compra in result.documents) {
          compras.add(OrderItem.fromSnapshot(compra));
        }
        return compras;
      },);

  void createCompra({String userId ,String id,String description,String status ,List<CarritoModelDB> cart, int totalPrice}) {
    List<Map> convertedCart = [];

    for(CarritoModelDB item in cart){
      convertedCart.add(item.toMap());
    }

    _firestore.collection(collection).document(id).setData({
      "userId": userId,
      "id": id,
      "cart": convertedCart,
      "total": totalPrice,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "description": description,
      "status": status
    });
  }
} 