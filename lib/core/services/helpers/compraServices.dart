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

  Future<List<ComprasModelDB>> getProductsByUser(Future<String> uid) async =>
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
}