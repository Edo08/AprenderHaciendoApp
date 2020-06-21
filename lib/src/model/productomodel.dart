class Sets {
  int id;
  int codigo;
  String nombre;
  String categoria;
  String image;
  double precio;
  bool isSelected ;
  Sets({this.id, this.codigo, this.nombre, this.categoria, this.precio, this.isSelected = false,this.image});
}
 
List<Sets> products = [
  Sets(id: 1, codigo: 45678, nombre: "Spike Prime", categoria: "Primaria", precio: 300 , image: "images/lego-spike.png"),
  Sets(id: 2, codigo: 45300, nombre: "WeDo 2.0", categoria: "Primaria", precio: 300 , image: "images/lego-spike.png"),
  Sets(id: 3, codigo: 40300, nombre: "holamundo", categoria: "Secundaria", precio: 300 , image: "images/LogoAH.png"),
];