import 'package:aprender_haciendo_app/ui/widgets/bodies/bodyAcademia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Academia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyAcademia(),
    );
  }
}