import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, this.color, this.textcolor, required this.buttonText});
  final color;
  final textcolor;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
              color: color,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(color: textcolor),
                ),
              ))),
    );
  }
}
