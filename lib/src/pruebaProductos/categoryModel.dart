//import 'package:cloud_firestore/cloud_firestore.dart';

    class CategoryModel{
     static const ID = "id";
     static const NAME = "name";
     String id;
     String name;

    //  named constructure
    CategoryModel();

    // deserialize data from firestore
      CategoryModel.fromMap(Map<String, dynamic> data){
       id = data[ID];
       name = data[NAME];
        }

      Map<String, dynamic> toMap() {
        return {
          'ID': id,
          'NAME':name,
        };
      }
    }
