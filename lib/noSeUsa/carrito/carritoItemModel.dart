/* import 'package:flutter/cupertino.dart';

class CarritoItemModel with ChangeNotifier {
  static const ID = "id";
  static const CODIGO = "codigo";
  static const NOMBRE = "nombre";
  static const IMAGE = "image";
  static const CANTIDAD = "cantidad";
  static const PRECIO = "precio";

  String _id;
  String _codigo;
  String _nombre;
  String _image;
  int _cantidad;
  double _precio;

  //  getters
  String get id => _id;
  String get codigo => _codigo;
  String get nombre => _nombre;
  String get image => _image;
  double get precio => _precio;
  int get cantidad => _cantidad;

  CarritoItemModel.fromMap(Map data) {
    _id = data[ID];
    _codigo = data[CODIGO];
    _nombre = data[NOMBRE];
    _image = data[IMAGE];
    _precio = data[PRECIO];
    _cantidad = data[CANTIDAD];
  }

  Map toMap() => {
        ID: _id,
        CODIGO: _codigo,
        NOMBRE: _nombre,
        IMAGE: _image,
        PRECIO: _precio,
        CANTIDAD: _cantidad,
      };
} */