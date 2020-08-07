class Eventos {
  int id;
  String nombre;
  String descripcion;
  String imagen;
  String fecha;
  String link;

  Eventos(
      {this.id,
      this.nombre,
      this.imagen,
      this.fecha,
      this.descripcion,
      this.link});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': nombre,
        'fecha': fecha,
        'imagen': imagen,
        'descripcion': descripcion,
        'link': link
      };
}

List<Eventos> eventos = [
  Eventos(
      id: 1,
      nombre: "First® LEGO® League",
      fecha: "13 de noviembre 2020",
      imagen: "https://firebasestorage.googleapis.com/v0/b/aprender-haciendo-app.appspot.com/o/firstlego.png?alt=media&token=d9b4b3c9-6622-4aee-83d4-90c98bc78b5c",
      descripcion: "WRO es una competencia mundial de robótica para los jóvenes. En ella se utiliza el equipo Mindstorms y Spike Prime fabricados por LEGO® Education. Realizado por primera vez en 2004 en Singapur, ahora atrae a 1000 participantes de 37 países. La competencia consiste en 4 Categorías diferentes: Regular , College , Open y Fútbol. Para las Categorías Open y Regular se subdivide en tres grupos de edad diferentes: A para los participantes menores de 13 años, B para los de 13 a 16 años y C para los de 17 a 19 años.",
      link: "http://www.firstlegoleaguecr.com/"),
  Eventos(
      id: 2,
      nombre: "Olimpiada Mundial de Robótica",
      fecha: "19 de Julio 2020",
      imagen: "https://firebasestorage.googleapis.com/v0/b/aprender-haciendo-app.appspot.com/o/WRO.png?alt=media&token=0c1aedc9-ad94-46cf-b7b5-63d5bf391d74",
      descripcion: "Es la competencia global de robótica más accesible, guiada, ayuda a los estudiantes y profesores a construir un mejor futuro juntos. El programa está construido alrededor de retos basados en un tema específico para involucrar niños desde los 9 hasta los 16 años en investigación, solución de problemas, codificación e ingeniería. La base del programa son los Valores fundamentales de FIRST, que hacen énfasis en trabajo en equipo, descubrimiento e innovación. Los estudiantes desarrollan más confianza, interés y se desarrollan con las habilidades que necesitan en una fuerza laboral cambiante. Actualmente hay tres categorías: FLL JR. Discovery Edition para equipos de niños de 4 a 6 años, FLL JR. para niños pequeños de edades entre los 6 y 10 años, FLL para niños desde los 9 hasta los 16 años.",
      link: "https://www.wrocostarica.org/"),     
];