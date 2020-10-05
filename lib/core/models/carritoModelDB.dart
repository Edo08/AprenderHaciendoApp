import 'package:flutter/material.dart';

class CarritoModelDB {
  static const ID = "id";
  static const CODIGO = "codigo";
  static const NOMBRE = "nombre";
  static const IMAGE = "image";
  static const PRECIO = "precio";

  String id;
  String codigo;
  String nombre;
  String image;
  int quantity;
  int precio;

  CarritoModelDB({
    @required this.codigo,
    @required this.nombre,
    @required this.image,
    @required this.quantity,
    @required this.precio,
  });

/*   String _id;
  String _codigo;
  String _nombre;
  String _image;
  int _precio; */

  CarritoModelDB.fromMap(Map data) {
    id = data[ID];
    nombre = data[NOMBRE];
    image = data[IMAGE];
    codigo = data[CODIGO];
    precio = data[PRECIO];
  }

  Map toMap() => {
    ID: id,
    IMAGE: image,
    NOMBRE: nombre,
    CODIGO: codigo,
    PRECIO: precio,
  };
}