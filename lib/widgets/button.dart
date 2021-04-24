import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.child, this.width, this.onPressed});

  final child;
  final width;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) => MaterialButton(
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      minWidth: width != null ? width : double.infinity,
      color: Theme.of(context).primaryColor,
      disabledColor: Theme.of(context).primaryColorLight,
      textColor: Colors.white,
      disabledTextColor: Colors.white,
      shape: StadiumBorder(side: BorderSide(width: double.infinity)),
      child: child,
      onPressed: onPressed);
}
