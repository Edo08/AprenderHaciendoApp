
class Product {
  int codigo;
  String nombre;
  String categoria;
  String imagen;
  String imagen2;
  double precio;
  int cantPiezas;
  bool isSelected;
  String descripcion;

  Product(
    {this.codigo, this.nombre, this.categoria, this.imagen,  
    this.imagen2, this.precio, this.cantPiezas, this.descripcion});


  /* Product.fromMap(Map snapshot) {
    codigo = snapshot['codigo'];
    nombre = snapshot['nombre'];
    categoria = snapshot['categoria'];
    precio = snapshot['precio'];
    cantPiezas = snapshot['cantPiezas'];
    imagen = snapshot['image'];
    imagen2 = snapshot['image2'];
    isSelected = snapshot['isSelect'];
  } */
   Product.fromMap(Map<String, dynamic> data) {
    codigo = data['codigo'];
    nombre = data['nombre'];
    categoria = data['categoria'];
    precio = data['precio'];
    cantPiezas = data['cantPiezas'];
    imagen = data['image'];
    imagen2 = data['image2'];
    isSelected = data['isSelect'];
  } 

  Map<String, dynamic> toJson() => {
    'codigo': codigo,
    'name': nombre,
    'categoria': categoria,
    'precio': precio,
    'cantPiezas': cantPiezas,
    'imagen': imagen,
    'imagen2' : imagen2,
    'isSelect': isSelected
  };

 
}






