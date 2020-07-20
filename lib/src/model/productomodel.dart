class Sets {
  int id;
  int codigo;
  String nombre;
  String categoria;
  String imagen;
  double precio;
  int cantPiezas;
  bool isSelected;
  String descripcion;

  Sets(
      {this.id,
      this.codigo,
      this.nombre,
      this.categoria,
      this.precio,
      this.cantPiezas,
      this.isSelected = false,
      this.imagen,
      this.descripcion});

  Map<String, dynamic> toJson() => {
        'id': id,
        'codigo': codigo,
        'name': nombre,
        'categoria': categoria,
        'precio': precio,
        'cantPiezas': cantPiezas,
        'imagen': imagen,
        'isSelect': isSelected
      };
}

List<Sets> products = [
  Sets(
      id: 1,
      codigo: 45678,
      nombre: "Spike Prime",
      categoria: "Primaria",
      precio: 359340,
      imagen: "images/lego-spike.png"),
  Sets(
      id: 2,
      codigo: 45025,
      nombre: "Coding Express",
      categoria: "Preescolar",
      precio: 244420,
      imagen: "images/45025_Coding.png"),
  Sets(
      id: 3,
      codigo: 45544,
      nombre: "Mindstorms EV3",
      categoria: "Secundaria",
      precio: 472695,
      imagen: "images/mindstorms-ev3.png"),
  Sets(
      id: 3,
      codigo: 45024,
      nombre: "Steam Park",
      categoria: "Preescolar",
      precio: 166900,
      imagen: "images/steamP.png"),
  Sets(
      id: 3,
      codigo: 45300,
      nombre: "WeDo 2.0",
      categoria: "Primaria",
      precio: 177265,
      imagen: "images/wedo.png"),
];

/* class Sets {
  int id;
  int codigo;
  String nombre;
  int tag;
  String categoria;
  String imagenCard;
  String imagen1;
  String imagen2;
  double precio;
  int cantPiezas;
  bool isSelected;
  String descripcion;
  Sets(
      {
      this.codigo,
      this.nombre,
      this.tag,
      this.categoria,
      this.precio,
      this.isSelected = false,
      this.imagenCard,
      this.imagen1,
      this.imagen2,
      this.descripcion});

Sets.fromMap(Map<String, dynamic> data) {
    codigo = data['codigo'];
    nombre = data['nombre'];
    categoria = data['categoria'];
    precio = data['precio'];
    imagenCard = data['image'];
    isSelected = data['isSelect'];
  }
  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'name': nombre,
      'categories': categoria,
      'precio':precio,
      'image':imagenCard,
      'isSelect':isSelected
    };
  }
}

class ItemCount {
   int itemType;
   int count;

   ItemCount.fromMap(Map<dynamic, dynamic> data)
       : itemType = data['itemType'],
         count = data['count'];
 } */
