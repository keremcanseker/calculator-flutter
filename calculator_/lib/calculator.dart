import 'package:flutter/material.dart';

import 'buttons.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CalculatorColor.backgroundcolor,
        body: Column(
          children: [
            Expanded(child: Container(), flex: 1),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return Button(
                      buttonText: buttons[index],
                      color: CalculatorColor.backgroundcolor1,
                      textcolor: CalculatorColor.textcolor,
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }
}

class CalculatorColor {
  static final backgroundcolor = Colors.deepPurple[100];
  static final backgroundcolor1 = Colors.deepPurple;
  static final textcolor = Colors.white;
}
