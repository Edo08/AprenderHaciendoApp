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

 /*  factory Product.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String codigo = data['codigo'];
    final String nombre = data['nombre'];
    final String categoria = data['categoria'];
    final double precio = data['precio'];
    final int cantPiezas = data['cantPiezas'];
    final String imagen = data['image'];
    final String imagen2 = data['image2'];
    final String descripcion = data['descripcion'];
    final bool isSelected = data['isSelect'];
    if (nombre == null) {
      return null;
    }
    return Product(
        codigo: codigo,
        nombre: nombre,
        categoria: categoria,
        imagen: imagen,
        imagen2: imagen2,
        precio: precio,
        cantPiezas: cantPiezas,
        isSelected: isSelected,
        descripcion: descripcion);
  } */

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
