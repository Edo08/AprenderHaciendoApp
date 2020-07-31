class Cursos{
  int id;
  String nombre;
  String imagen;
  double precio;
  String modalidad;
  String rangoEdad;
  String descripcion;

  Cursos(
      {this.id,
      this.nombre,
      this.precio,
      this.imagen,
      this.modalidad,
      this.rangoEdad,
      this.descripcion});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': nombre,
        'precio': precio,
        'modalidad': modalidad,
        'imagen': imagen,
        'rangoEdad' : rangoEdad,
        'descripcion' : descripcion
      };
}

List<Cursos> cursos = [
  
  Cursos(
      id: 1,
      nombre: "Coding Express",
      precio: 58140,
      imagen: "images/45025_Coding.png",
      modalidad: "Online",
      rangoEdad: "3 a 5 años",
      descripcion: "12 sesiones en vivo de una hora cada una, con profesores certificados. No incluye el set"),
  Cursos(
      id: 2,
      nombre: "Steam Park",
      precio: 58140,
      imagen: "images/steamP.png",
      modalidad: "Online",
      rangoEdad: "3 a 5 años",
      descripcion: "12 sesiones en vivo de una hora cada una, con profesores certificados. No incluye el set"),
  Cursos(
      id: 3,
      nombre: "Máquinas Simples Iniciales",
      precio: 58140,
      imagen: "images/9656.png",
      modalidad: "Online",
      rangoEdad: "3 a 5 años",
      descripcion: "12 sesiones en vivo de una hora cada una, con profesores certificados. No incluye el set"),
  Cursos(
      id: 4,
      nombre: "WeDo 2.0",
      precio: 69770,
      imagen: "images/wedo.png",
      modalidad: "Online",
      rangoEdad: "6 a 8 años",
      descripcion: "12 sesiones en vivo de una hora cada una, con profesores certificados. No incluye el set"),
  Cursos(
      id: 5,
      nombre: "Spike Prime",
      precio: 87210,
      imagen: "images/lego-spike.png",
      modalidad: "Online",
      rangoEdad: "9 años en adelante",
      descripcion: "12 sesiones en vivo de una hora y media cada una, con profesores certificados. No incluye el set"),
  Cursos(
      id: 6,
      nombre: "Mindstorms EV3",
      precio: 87210,
      imagen: "images/mindstorms-ev3.png",
      modalidad: "Online",
      rangoEdad: "12 años en adelante",
      descripcion: "12 sesiones en vivo de una hora y media cada una, con profesores certificados. No incluye el set"),     
];