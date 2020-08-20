import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AcademyModelDB with ChangeNotifier {
  static const ID = "id";
  static const NOMBRE = "nombre";
  static const PRECIO = "precio";
  static const IMAGEN = "imagen";
  static const MODALIDAD = "modalidad";
  static const ISSELECTED = "isselected";
  static const HORARIO = "horario";

  int _id;
  String _nombre;
  int _precio;
  String _imagen;
  String _modalidad;
  bool _isSelected;
  String _horario;
  


  int get id => _id;
  String get nombre => _nombre;
  int get precio => _precio;
  String get imagen => _imagen;
  String get modalidad => _modalidad;
  String get horario => _horario;
  bool get isSelected => _isSelected;
  
  // public variable
  bool liked = false;

  AcademyModelDB.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _nombre = snapshot.data[NOMBRE];
    _precio = snapshot.data[PRECIO].floor();
    _imagen = snapshot.data[IMAGEN];
    _modalidad = snapshot.data[MODALIDAD];
    _horario = snapshot.data[HORARIO];
    _isSelected = snapshot.data[ISSELECTED];
  }
}
