class Packs {
  int id;
  int codigo;
  String nombre;
  String imagen;
  String imagen2;
  double precio;
  int cantPiezas;
  String descripcion;
  String edades;
  

 Packs(
      {this.id,
      this.codigo,
      this.nombre,
      this.precio,
      this.cantPiezas,
      this.imagen,
      this.descripcion,
      this.edades});

  Map<String, dynamic> toJson() => {
        'id': id,
        'codigo': codigo,
        'name': nombre,
        'precio': precio,
        'cantPiezas': cantPiezas,
        'imagen': imagen,
        'edades': edades
      };
}

List<Packs> paquetes = [
  Packs(
      id: 1,
      codigo: 2000,
      nombre: "7 Bricks",
      precio: 16500,
      imagen: "images/Logo_7bricks.png",
      descripcion: "Set pensado para desarrollar tanto el área cognitiva como el pensamiento lógico matemático, habilidades lingüísticas y el desarrollo psicomotor de los niños. Contiene libro con más de 60 actividades en el área de matemática y español.",
      cantPiezas: 7,
      edades: "4 a 6 años"),
  Packs(
      id: 2,
      codigo: 2000,
      nombre: "7 Bricks Plus",
      precio: 21500,
      imagen: "images/Logo_7bricks_+.png",
      descripcion: "La versión extendida del set 7 Bricks. Este contiene dos libros con más de 60 actividades cada uno, para desarrollar tanto el área cognitiva como el pensamiento lógico matemático, habilidades lingüísticas y el desarrollo psicomotor de los niños.",
      cantPiezas: 35,
      edades: "4 a 6 años"),
  Packs(
      id: 3,
      codigo: 20001,
      nombre: "Máquinas y mecanismos",
      precio: 24500,
      imagen: "images/mezcladora.png",
      descripcion: "Motiva a los estudiantes a diseñar, construir y programar robots, otorgando un mejor entendimiento de cómo funciona la tecnología en problemas de la vida real.",
      cantPiezas: 312,
      edades: "7 a 12 años"),
  Packs(
      id: 4,
      codigo: 20001,
      nombre: "Mecanismos motorizados",
      precio: 46900,
      imagen: "images/motorizado.png",
      descripcion: "Este set se creó para desarrollar habilidades en áreas de STEAM (Ciencia, Tecnología, Ingeniería, Arte y Matemática por sus siglas en inglés). Contiene libro con 16 ejercicios relacionados con máquinas y mecanismos motorizados, los cuales incluyen actividades lúdicas para el aprendizaje de las distintas máquinas simples, de forma divertida e interactiva.",
      cantPiezas: 314,
      edades: "7 a 12 años"),
  Packs(
      id: 5,
      codigo: 2001,
      nombre: "Robótica",
      precio: 95500,
      imagen: "images/wedo.png",
      descripcion: "Este set fue diseñado para fomentar la colaboración, combina ladrillos LEGO® con software para su programación, que presenta a los estudiantes principios de ciencia, ingeniería y computación.",
      cantPiezas: 315,
      edades: "7 a 12 años"),
];