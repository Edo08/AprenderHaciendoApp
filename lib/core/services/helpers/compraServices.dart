import 'package:aprender_haciendo_app/core/models/cartItemModel.dart';
import 'package:aprender_haciendo_app/core/models/comprasModelDB.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompraServices {
  String collection = "compras";
  Firestore _firestore = Firestore.instance;

  Future<List<ComprasModelDB>> getCompras() async =>
      _firestore.collection(collection).getDocuments().then(
        (result) {
          List<ComprasModelDB> compras = [];
          for (DocumentSnapshot compra in result.documents) {
            compras.add(ComprasModelDB.fromSnapshot(compra));
          }
          return compras;
        },
      );

  Future<List<ComprasModelDB>> getComprasByUser(Future<String> uid) async =>
      _firestore
          .collection(collection)
          .where ("uid", isEqualTo:await  uid)
          .getDocuments()
          .then((result) {
        List<ComprasModelDB> compras = [];
        for (DocumentSnapshot compra in result.documents) {
          compras.add(ComprasModelDB.fromSnapshot(compra));
        }
        return compras;
      },);

  void createCompra({String userId ,String id,String description,String status ,List<CartItemModel> cart, int totalPrice}) {
    List<Map> convertedCart = [];

    for(CartItemModel item in cart){
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