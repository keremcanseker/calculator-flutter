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
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '.',
    '0',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CalculatorColor.backgroundcolor,
        body: Column(
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return Button(
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? CalculatorColor.backgroundcolor1
                          : CalculatorColor.operator,
                      textcolor: isOperator(buttons[index])
                          ? CalculatorColor.textcolor
                          : CalculatorColor.backgroundcolor1,
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }

  bool isOperator(String x) {
    if (x == "-" || x == '+' || x == '*' || x == "/" || x == '%' || x == '=') {
      return true;
    }
    return false;
  }
}

class CalculatorColor {
  static final backgroundcolor = Colors.deepPurple[100];
  static const backgroundcolor1 = Colors.deepPurple;
  static final operator = Colors.deepPurple[50];
  static const black = Colors.black;
  static const textcolor = Colors.white;
}
