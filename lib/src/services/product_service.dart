import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService{
  final _fireStore = Firestore.instance;

  Future <QuerySnapshot>getProducts() async{
    return await _fireStore.collection("products").getDocuments();
  } 

  Future getProductsSnap() async {
    QuerySnapshot qn = await _fireStore.collection("products").getDocuments();  
    return qn.documents;
  }


}
  //final _service = FirestoreService.instance;

  /* Stream<List<Product>> products() => _service.collectionStream(
        path: FirestorePath.products(),
        builder: (data, documentId) => Product.fromMap(data, documentId),
      );

  Stream<Product> product(String code) => _service.documentStream(
        path: FirestorePath.product(code),
        builder: (data, documentId) => Product.fromMap(data, documentId),
      );
*/
