class Cursos{
  int id;
  String nombre;
  String imagen;
  double precio;
  String modalidad;
  String rangoEdad;
  bool isSelected;

  Cursos(
      {this.id,
      this.nombre,
      this.precio,
      this.imagen,
      this.modalidad,
      this.rangoEdad});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': nombre,
        'precio': precio,
        'modalidad': modalidad,
        'imagen': imagen,
        'rangoEdad' : rangoEdad,
        'isSelect': isSelected
      };
}

List<Cursos> cursos = [
  Cursos(
      id: 1,
      nombre: "Spike Prime",
      precio: 359340,
      imagen: "images/lego-spike.png",
      modalidad: "Online",
      rangoEdad: "9 años en adelante"),
  Cursos(
      id: 2,
      nombre: "Coding Express",
      precio: 244420,
      imagen: "images/45025_Coding.png",
      modalidad: "Online"),
  Cursos(
      id: 3,
      nombre: "Mindstorms EV3",
      precio: 472695,
      imagen: "images/mindstorms-ev3.png",
      modalidad: "Online",
      rangoEdad: "12 años en adelante"),

  Cursos(
      id: 5,
      nombre: "WeDo 2.0",
      precio: 177265,
      imagen: "images/wedo.png",
      modalidad: "Online",
      rangoEdad: "6 a 8 años"),
      
];