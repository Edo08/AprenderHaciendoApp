class Eventos {
  int id;
  String nombre;
  String imagen;
  String fecha;
  String link;
  bool isSelected;

  Eventos(
      {this.id,
      this.nombre,
      this.imagen,
      this.fecha});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': nombre,
        'fecha': fecha,
        'imagen': imagen,
        'isSelect': isSelected
      };
}

List<Eventos> eventos = [
  Eventos(
      id: 1,
      nombre: "First® LEGO® League",
      fecha: "13 de noviembre 2020",
      imagen: "images/firstlego.png",),
  Eventos(
      id: 2,
      nombre: "Olimpiada Mundial de Robótica",
      fecha: "19 de Julio 2020",
      imagen: "images/WRO.png",),     
];