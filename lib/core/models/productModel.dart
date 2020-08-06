import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  int id;
  String codigo;
  String nombre;
  String categoria;
  String imagen;
  String imagen2;
  double precio;
  int cantPiezas;
  bool isSelected;
  String descripcion;
  String edades;

  ProductModel(
      {this.id,
      this.codigo,
      this.nombre,
      this.categoria,
      this.imagen,
      this.imagen2,
      this.precio,
      this.cantPiezas,
      this.descripcion,
      this.edades,
      this.isSelected = false});

  void toggleSelected() {
    isSelected = !isSelected;
    print("this item is favorite - $isSelected");
    notifyListeners();
  }
}
