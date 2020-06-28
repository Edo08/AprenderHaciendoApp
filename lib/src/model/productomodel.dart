class Sets {
  int id;
  int codigo;
  String nombre;
  String categoria;
  String imagenCard;
  String imagen1;
  String imagen2;
  double precio;
  int cantPiezas;
  bool isSelected;
  String descripcion;
  Sets({this.id, this.codigo, this.nombre, this.categoria, this.precio, this.cantPiezas ,this.isSelected = false,this.imagenCard, this.imagen1, this.imagen2, this.descripcion});
}
 
List<Sets> products = [
  Sets(id: 1, codigo: 45678, nombre: "Spike Prime", categoria: "Primaria", precio: 359340 , imagenCard: "images/lego-spike.png"),
  Sets(id: 2, codigo: 45025, nombre: "Coding Express", categoria: "Preescolar", precio: 244420 , imagenCard: "images/45025_Coding.png"),
  Sets(id: 3, codigo: 45544, nombre: "Mindstorms EV3", categoria: "Secundaria", precio: 472695 , imagenCard: "images/mindstorms-ev3.png"),
  Sets(id: 3, codigo: 45024, nombre: "Steam Park", categoria: "Preescolar", precio: 166900 , imagenCard: "images/steamP.png"),
  Sets(id: 3, codigo: 45300, nombre: "WeDo 2.0", categoria: "Primaria", precio: 177265 , imagenCard: "images/wedo.png"),
];