import 'package:flutter/material.dart';

class ValidacionPass extends StatefulWidget {
  @override
  _ValidacionPassState createState() => _ValidacionPassState();
}

class _ValidacionPassState extends State<ValidacionPass>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  TextEditingController textController = TextEditingController();

  bool eightChars = false;
  bool specialChar = false;
  bool upperCaseChar = false;
  bool number = false;

//incompleto....

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}