import 'package:flutter/material.dart';
 
final TextStyle codigoStyle =
    TextStyle(fontSize: 15, fontFamily: "Muli", color: Colors.white,
     fontWeight: FontWeight.w700,
     shadows: <Shadow>[
      Shadow(
        offset: Offset(3.0, 1.0),
        blurRadius: 3.0,
        color: Color.fromARGB(150, 0, 0, 0),
      )] );
final TextStyle botonStyle =
    TextStyle(fontSize: 14, fontFamily: "Poppins-Medium", color: Colors.white, fontWeight: FontWeight.w500);
final TextStyle nombreStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins-Medium", color: Colors.white, fontWeight: FontWeight.w700);
final TextStyle subTitleStyle =
    TextStyle(fontFamily: "Poppins-Medium", color: Colors.white, fontWeight: FontWeight.w700,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(3.0, 1.0),
        blurRadius: 3.0,
        color: Color.fromARGB(150, 0, 0, 0),
      )]);

 class PerfilCard extends StatelessWidget {
  const PerfilCard({
    Key key, this.itemIndex, this.press,
  }) : super(key: key);

  final int itemIndex;
  //final Cursos curso;
  final Function press;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 20.0 / 2,
      ),
      height: 470,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 450,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                colors: [Color(0xFFf0c419), Color(0xFFf7d759)],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]
            ),
          ),            
          SizedBox(
            height: 470,
            child: Column(
              children: <Widget>[
                SizedBox(height: 35,), 
                Text(
                  "Correo Electrónico",
                  style: nombreStyle,
                  ),
                Text(
                  "edomm08@gmail.com",
                  style: subTitleStyle,
                  ),
                SizedBox(height: 10,),
                Text(
                  "Fecha de nacimiento",
                  style: nombreStyle,
                  ),
                Text(
                  "20/06/1992",
                  style: subTitleStyle,
                  ),
                SizedBox(height: 10,),
                Text(
                  "Nombre completo",
                  style: nombreStyle,
                  ),
                Text(
                  "Eduardo Muñoz",
                  style: subTitleStyle,
                  ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF37b5e7), Color(0xFF61bfd4)
                                  ],begin: Alignment.topCenter,
                                  end: Alignment.bottomRight ),
                                  borderRadius: BorderRadius.circular(10)),
                            child: Text("Editar perfil", style: botonStyle,),
                          ),
                          onTap: (){

                          },
                        ),                            
                      ],
                    ), 
                ),     
              ],
            ),
          )
        ],
      ),          
    );    
  }
}