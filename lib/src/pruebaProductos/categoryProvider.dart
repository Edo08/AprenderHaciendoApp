import 'package:aprender_haciendo_app/src/pruebaProductos/categoryModel.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categoryList=[];
  CategoryModel _currentCategory;
  List<CategoryModel> _featuredCategoryList=[];


//  getter
  List<CategoryModel> get categoryList => _categoryList;
  List<CategoryModel> get featuredCategoryList => _featuredCategoryList;
  CategoryModel get currentCategory => _currentCategory;


//  setter
  set categoryList(List<CategoryModel> categoryList) {
    _categoryList = categoryList;
    notifyListeners();
  }

   set featuredCategoryList(List<CategoryModel> featuredCategoryList) {
    _featuredCategoryList = featuredCategoryList;
    notifyListeners();
  }

   set currentCategory(CategoryModel category) {
    _currentCategory = category;
    notifyListeners();
  }

   addCategory(CategoryModel category) {
    _categoryList.insert(0, category);
    notifyListeners();
  }

  deleteCategory(CategoryModel category) {
    _categoryList.removeWhere((_category) => _category.id == category.id);
    notifyListeners();
  }

}