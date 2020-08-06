/* class Sets {
  int id;
  int codigo;
  String nombre;
  String categoria;
  String imagen;
  String imagen2;
  double precio;
  int cantPiezas;
  String descripcion;
  String edades;

  Sets(
      {this.id,
      this.codigo,
      this.nombre,
      this.categoria,
      this.precio,
      this.cantPiezas,
      this.imagen,
      this.descripcion,
      this.edades});

  Map<String, dynamic> toJson() => {
        'id': id,
        'codigo': codigo,
        'name': nombre,
        'categoria': categoria,
        'precio': precio,
        'cantPiezas': cantPiezas,
        'imagen': imagen,
        'edades': edades
      };
}

List<Sets> products = [
  Sets(
      id: 1,
      codigo: 45678,
      nombre: "Spike Prime",
      categoria: "Primaria",
      precio: 359340,
      imagen: "images/lego-spike.png",
      descripcion: "Ayuda a los estudiantes a desarrollar las habilidades esenciales de STEAM y del siglo XXI para que se conviertan en las mentes innovadoras del mañana mientras se divierten, con un hardware fácil de usar y un intuitivo lenguaje de programación para arrastrar y soltar con base en Scratch.",
      cantPiezas: 523,
      edades: "10 a 12 años"),
  Sets(
      id: 2,
      codigo: 45025,
      nombre: "Coding Express",
      categoria: "Preescolar",
      precio: 244420,
      imagen: "images/45025_Coding.png",
      descripcion: "Coding Express combina elementos digitales y físicos, como los ladrillos, los cambios de vías y los ladrillos de acción, para presentarle a los estudiantes de educación inicial los conceptos de programación como secuencias, bucles y condicionales. Los estudiantes aprenderán habilidades de colaboración y lenguaje, pensamiento crítico y más a medida que exploran y crean escenarios con un set de tren clásico.",
      cantPiezas: 234,
      edades: "3 a 5 años"),
  Sets(
      id: 3,
      codigo: 45544,
      nombre: "Mindstorms EV3",
      categoria: "Secundaria",
      precio: 472695,
      imagen: "images/mindstorms-ev3.png",
      descripcion: "Motiva a los estudiantes a diseñar, construir y programar robots, otorgando un mejor entendimiento de cómo funciona la tecnología en problemas de la vida real.",
      cantPiezas: 541,
      edades: "12 años en adelante"),
  Sets(
      id: 4,
      codigo: 45024,
      nombre: "Steam Park",
      categoria: "Preescolar",
      precio: 166900,
      imagen: "images/steamP.png",
      descripcion: "Se basa en la curiosidad y el deseo natural de los niños de crear, explorar e investigar el mundo de las ciencias, la tecnología, la ingeniería, el arte y las matemáticas (STEAM) a través del juego creativo. Las posibilidades son infinitas, a medida que construyen un parque lleno de atracciones dinámicas, juegos divertidos y escenas con una selección especial de ladrillos LEGO® DUPLO®.",
      cantPiezas: 295,
      edades: "3 a 5 años"),
  Sets(
      id: 5,
      codigo: 45300,
      nombre: "WeDo 2.0",
      categoria: "Primaria",
      precio: 177265,
      imagen: "images/wedo.png",
      descripcion: "Este set fue diseñado para fomentar la colaboración, combina ladrillos LEGO® con software para su programación, que presenta a los estudiantes principios de ciencia, ingeniería y computación.",
      cantPiezas: 280,
      edades: "6 a 10 años"),
]; */

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
