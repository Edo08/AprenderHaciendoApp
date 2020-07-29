import 'package:aprender_haciendo_app/core/models/categoryModel.dart';
import 'package:aprender_haciendo_app/core/services/helpers/categoryServices.dart';
import 'package:flutter/material.dart';


class CategoryProvider with ChangeNotifier{
  CategoryServices _categoryServices = CategoryServices();
  List<CategoryModel> categories = [];

  CategoryProvider.initialize(){
    loadCategories();
  }

  loadCategories()async{
    categories = await _categoryServices.getCategories();
    notifyListeners();
  }
}