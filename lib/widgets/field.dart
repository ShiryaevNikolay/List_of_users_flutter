import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.label, this.controller, this.passwordType = false});

  final label;
  final controller;
  final passwordType;

  @override
  Widget build(BuildContext context) => TextFormField(
        obscureText: passwordType,
        controller: controller,
        decoration: InputDecoration(labelText: label),
      );
}
