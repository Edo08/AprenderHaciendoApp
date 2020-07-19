import 'package:aprender_haciendo_app/src/pruebaProductos/categoryModel.dart';

class ProductModel {
  String id;
  String name;
  List<CategoryModel> categories;

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    categories = data[
        'categories']; 
        // here there is a problem, as i can't get product document with list of objects 
        //but i am working on it
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'categories':
          categories.map((i) => i.toMap()).toList(), // this worked well
    };
  }
}

/* class CategoryModel {
  String id;
  String name;

  CategoryModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
} */
