/* import 'package:aprender_haciendo_app/core/models/productModel.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> products = [
  ProductModel(
      id: 1,
      codigo: "45678",
      nombre: "Spike Prime",
      categoria: "Primaria",
      precio: 359340,
      imagen: "images/lego-spike.png",
      imagen2: "https://firebasestorage.googleapis.com/v0/b/aprender-haciendo-app.appspot.com/o/lego-spike.png?alt=media&token=c0e0a7b6-aead-462f-a904-07386aea29d1",
      descripcion: "Ayuda a los estudiantes a desarrollar las habilidades esenciales de STEAM y del siglo XXI para que se conviertan en las mentes innovadoras del mañana mientras se divierten, con un hardware fácil de usar y un intuitivo lenguaje de programación para arrastrar y soltar con base en Scratch.",
      cantPiezas: 523,
      edades: "10 a 12 años"),
  ProductModel(
      id: 2,
      codigo: "45025",
      nombre: "Coding Express",
      categoria: "Preescolar",
      precio: 244420,
      imagen: "images/45025_Coding.png",
      imagen2: "https://firebasestorage.googleapis.com/v0/b/aprender-haciendo-app.appspot.com/o/45025_Coding.png?alt=media&token=c52803ee-a920-4980-8a91-0bf0ed1c7fa2",
      descripcion: "Coding Express combina elementos digitales y físicos, como los ladrillos, los cambios de vías y los ladrillos de acción, para presentarle a los estudiantes de educación inicial los conceptos de programación como secuencias, bucles y condicionales. Los estudiantes aprenderán habilidades de colaboración y lenguaje, pensamiento crítico y más a medida que exploran y crean escenarios con un set de tren clásico.",
      cantPiezas: 234,
      edades: "3 a 5 años"),
  ProductModel(
      id: 3,
      codigo: "45544",
      nombre: "Mindstorms EV3",
      categoria: "Secundaria",
      precio: 472695,
      imagen: "images/mindstorms-ev3.png",
      imagen2: "https://firebasestorage.googleapis.com/v0/b/aprender-haciendo-app.appspot.com/o/mindstorms-ev3.png?alt=media&token=8604c652-6b5a-45bb-a6b9-0bcd8b1099e8",
      descripcion: "Motiva a los estudiantes a diseñar, construir y programar robots, otorgando un mejor entendimiento de cómo funciona la tecnología en problemas de la vida real.",
      cantPiezas: 541,
      edades: "12 años en adelante"),
  ProductModel(
      id: 4,
      codigo: "45024",
      nombre: "Steam Park",
      categoria: "Preescolar",
      precio: 166900,
      imagen: "images/steamP.png",
      imagen2: "https://firebasestorage.googleapis.com/v0/b/aprender-haciendo-app.appspot.com/o/steamP.png?alt=media&token=c7e8e05b-a924-4590-9d6b-3c4ce1d52bcb",
      descripcion: "Se basa en la curiosidad y el deseo natural de los niños de crear, explorar e investigar el mundo de las ciencias, la tecnología, la ingeniería, el arte y las matemáticas (STEAM) a través del juego creativo. Las posibilidades son infinitas, a medida que construyen un parque lleno de atracciones dinámicas, juegos divertidos y escenas con una selección especial de ladrillos LEGO® DUPLO®.",
      cantPiezas: 295,
      edades: "3 a 5 años"),
  ProductModel(
      id: 5,
      codigo: "45300",
      nombre: "WeDo 2.0",
      categoria: "Primaria",
      precio: 177265,
      imagen: "images/wedo.png",
      imagen2: "https://firebasestorage.googleapis.com/v0/b/aprender-haciendo-app.appspot.com/o/wedo.png?alt=media&token=5c57f13b-8578-4556-b668-32573aceee54",
      descripcion: "Este set fue diseñado para fomentar la colaboración, combina ladrillos LEGO® con software para su programación, que presenta a los estudiantes principios de ciencia, ingeniería y computación.",
      cantPiezas: 280,
      edades: "6 a 10 años"),
  ];
 
  var isSelected = false;

  List<ProductModel> get items {
    if (isSelected)
      return products.where((product) => product.isSelected).toList();
    return [...products];
  }

 /*  ProductModel findByCode(int productCode) {
    return products.firstWhere((p) => p.codigo == productCode);
  } */

  void showSelected() {
    isSelected = true;
    print("show favourite flag ON");
    notifyListeners();
  }

  void showAll() {
    isSelected = false;
    print("show favourite flag OFF");
    notifyListeners();
  }
}
 */