import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      this.color,
      this.textcolor,
      required this.buttonText,
      required this.buttonTapped});
  final color;
  final textcolor;
  final String buttonText;
  final buttonTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: color,
            child: Center(
              child: Text(buttonText,
                  style: TextStyle(color: textcolor, fontSize: 20)),
            ),
          ),
        ),
      ),
    );
  }
}
