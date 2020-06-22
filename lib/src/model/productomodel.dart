class Sets {
  int id;
  int codigo;
  String nombre;
  String categoria;
  String image;
  double precio;
  bool isSelected;
  Sets({this.id, this.codigo, this.nombre, this.categoria, this.precio, this.isSelected = false,this.image});
}
 
List<Sets> products = [
  Sets(id: 1, codigo: 45678, nombre: "Spike Prime", categoria: "Primaria", precio: 359340 , image: "images/lego-spike.png"),
  Sets(id: 2, codigo: 45025, nombre: "Coding Express", categoria: "Preescolar", precio: 244420 , image: "images/45025_Coding.png"),
  Sets(id: 3, codigo: 45544, nombre: "Mindstorms EV3", categoria: "Secundaria", precio: 472695 , image: "images/mindstorms-ev3.png"),
  Sets(id: 3, codigo: 45024, nombre: "Steam Park", categoria: "Preescolar", precio: 166900 , image: "images/steamP.png"),
  Sets(id: 3, codigo: 45300, nombre: "WeDo 2.0", categoria: "Primaria", precio: 177265 , image: "images/wedo.png"),
];