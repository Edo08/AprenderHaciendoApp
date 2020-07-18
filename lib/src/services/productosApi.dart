import 'package:cloud_firestore/cloud_firestore.dart';

var firestore = Firestore.instance;

Future getProducts() async {
  QuerySnapshot qn = await firestore.collection("products").getDocuments();  
  return qn.documents;
}


/* getProducts(ProductProvider productProvider) async {
  QuerySnapshot snapshot =
      await Firestore.instance.collection('products').getDocuments();
  List<ProductModel> _productList = [];
  snapshot.documents.forEach((document) {
    ProductModel product = ProductModel.fromMap(document.data);
    _productList.add(product);
  });
  productProvider.productList = _productList;
}

uploadProduct(ProductModel product, bool isUpdating, Function productUploaded,
    {String imageUrl}) async {
  CollectionReference productRef = Firestore.instance.collection('products');

  if (isUpdating) {
    await productRef.document(product.id).updateData(product.toMap());
    productUploaded(product);
    print('updated product with id: ${product.id}');
  } else {
    DocumentReference documentRef = await productRef.add(product.toMap());
    product.id = documentRef.documentID;
    print('uploaded successfully: ${product.toString()}');
    await documentRef.setData(product.toMap(), merge: true);
    productUploaded(product);
  }
}

deleteProduct(ProductModel product, Function productDeleted) async {
  await Firestore.instance.collection('products').document(product.id).delete();
  productDeleted(product);
}
 */

