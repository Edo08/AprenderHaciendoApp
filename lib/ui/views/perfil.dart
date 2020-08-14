import 'package:aprender_haciendo_app/ui/widgets/bodies/bodyPerfil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  static const String routeName = '/perfil';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyPerfil(),
    );
  }
}