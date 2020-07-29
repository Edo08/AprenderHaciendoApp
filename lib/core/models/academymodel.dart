class Academys {
  int id;
  String nombre;
  String imagen;
  double precio;
  String modalidad;
  String horario;
  bool isSelected;

  Academys(
      {this.id,
      this.nombre,
      this.precio,
      this.imagen,
      this.modalidad,
      this.horario});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': nombre,
        'precio': precio,
        'modalidad': modalidad,
        'imagen': imagen,
        'horario' : horario,
        'isSelect': isSelected
      };
}

List<Academys> certificaciones = [
  Academys(
      id: 1,
      nombre: "Spike Prime",
      precio: 359340,
      imagen: "images/legoAcademy.png",
      modalidad: "Online"),
  Academys(
      id: 2,
      nombre: "Preescolar",
      precio: 244420,
      imagen: "images/legoAcademy.png",
      modalidad: "Online"),
  Academys(
      id: 3,
      nombre: "Mindstorms EV3",
      precio: 472695,
      imagen: "images/legoAcademy.png",
      modalidad: "Online"),

  Academys(
      id: 5,
      nombre: "WeDo 2.0",
      precio: 177265,
      imagen: "images/legoAcademy.png",
      modalidad: "Online"),
      
];