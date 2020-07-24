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