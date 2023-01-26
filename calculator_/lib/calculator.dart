import 'package:flutter/material.dart';

import 'buttons.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CalculatorColor.backgroundcolor,
        body: Column(
          children: [
            Expanded(child: Container(), flex: 1),
            Expanded(
              child: Container(
                child: Button(
                    color: Colors.deepOrange,
                    buttonText: "haha",
                    textcolor: Colors.white),
              ),
              flex: 2,
            ),
          ],
        ));
  }
}

class CalculatorColor {
  static final backgroundcolor = Colors.deepPurple[100];
}
