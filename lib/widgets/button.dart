import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.child});

  final child;

  @override
  Widget build(BuildContext context) =>
      MaterialButton(
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        minWidth: double.infinity,
        color: Colors.purple,
        textColor: Colors.white,
        shape: StadiumBorder(
          side: BorderSide(
            width: double.infinity
          )
        ),
        child: child, onPressed: () {}
      );
}
