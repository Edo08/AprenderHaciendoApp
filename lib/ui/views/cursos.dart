import 'package:aprender_haciendo_app/ui/widgets/bodies/bodyCursos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cursos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyCursos(),
    );
  }
}