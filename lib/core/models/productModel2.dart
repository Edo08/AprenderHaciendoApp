/* import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel2 {
  static const CODIGO = "codigo";
  static const NOMBRE = "nombre";
  static const DESCRIPCION = "descripcion";
  static const CATEGORIA = "categoria";
  static const PRECIO = "precio";
  static const CANTPIEZAS = "cantpiezas";
  static const IMAGEN = "imagen";
  static const IMAGEN2 = "imagen2";
  static const ISSELECTED = "isselected";

  int _codigo;
  String _nombre;
  String _descripcion;
  String _categoria;
  double _precio;
  int _cantPiezas;
  String _imagen;
  String _imagen2;
  bool _isSelected;

  int get codigo => _codigo;
  String get nombre => _nombre;
  String get descripcion => _descripcion;
  String get categoria => _categoria;
  double get precio => _precio;
  int get cantpiezas => _cantPiezas;
  String get imagen => _imagen;
  String get imagen2 => _imagen2;
  bool get isSelected => _isSelected;

  // public variable
  bool liked = false;

  ProductModel2.fromSnapshot(DocumentSnapshot snapshot) {
    _codigo = snapshot.data[CODIGO];
    _nombre = snapshot.data[NOMBRE];
    _descripcion = snapshot.data[DESCRIPCION];
    _categoria = snapshot.data[CATEGORIA];
    _precio = snapshot.data[PRECIO].floor();
    _cantPiezas = snapshot.data[CANTPIEZAS];
    _imagen = snapshot.data[IMAGEN];
    _imagen2 = snapshot.data[IMAGEN2];
    _isSelected = snapshot.data[ISSELECTED];
  }
}
 */