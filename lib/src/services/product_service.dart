import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService{
  final _fireStore = Firestore.instance;

  Future <QuerySnapshot>getProduct() async{
    return await _fireStore.collection("products").getDocuments();
  } 


}