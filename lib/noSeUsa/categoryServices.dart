/* import 'package:aprender_haciendo_app/core/models/categoryModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryServices {
  String collection = "categories";
  Firestore _firestore = Firestore.instance;

  Future<List<CategoryModel>> getCategories() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<CategoryModel> categories = [];
        for(DocumentSnapshot category in result.documents){
            categories.add(CategoryModel.fromSnapshot(category));
        }
        return categories;
      });
} */