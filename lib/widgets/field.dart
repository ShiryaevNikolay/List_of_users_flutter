import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  CustomTextField({this.label = ""});

  final String label;
  
  @override
  Widget build(BuildContext context) => TextFormField(
    decoration: InputDecoration(
      labelText: label
    ),
  );
}
