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

  Product.fromMap(Map snapshot, String id) {
    codigo = snapshot['codigo']??'';
    nombre = snapshot['nombre']??'';
    categoria = snapshot['categoria']??'';
    precio = snapshot['precio']??'';
    cantPiezas = snapshot['cantPiezas']??'';
    imagen = snapshot['image']??'';
    imagen2 = snapshot['image2']??'';
    isSelected = snapshot['isSelect']??'';
  }

  toJson() {
    return {
      'codigo': codigo,
      'name': nombre,
      'categoria': categoria,
      'precio': precio,
      'cantPiezas': cantPiezas,
      'imagen': imagen,
      'isSelect': isSelected
    };
  }

  
}
