import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

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
  var userQuestion = '';
  var userAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CalculatorColor.backgroundcolor,
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 40),
                    Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Text(userQuestion,
                            maxLines: 2, style: const TextStyle(fontSize: 30))),
                    Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(userAnswer,
                            style: const TextStyle(fontSize: 40))),
                  ],
                )),
            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return Button(
                    buttonTapped: () {
                      setState(() {
                        if (index == 0) {
                          userQuestion = "";
                          userAnswer = '';
                        } else if (index == 1) {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        } else if (index == buttons.length - 1) {
                          pressEqual();
                        } else {
                          userQuestion += buttons[index];
                        }
                      });
                    },
                    buttonText: buttons[index],
                    color: isClear(buttons[index])
                        ? Colors.green
                        : isDel(buttons[index])
                            ? Colors.red
                            : isOperator(buttons[index])
                                ? CalculatorColor.backgroundcolor1
                                : CalculatorColor.operator,
                    textcolor: isOperator(buttons[index])
                        ? CalculatorColor.textcolor
                        : CalculatorColor.backgroundcolor1,
                  );
                },
              ),
            )
          ],
        ));
  }

  bool isClear(String s) {
    if (s == 'C') {
      return true;
    }
    return false;
  }

  bool isDel(String s) {
    if (s == 'DEL') {
      return true;
    }
    return false;
  }

  bool isOperator(String x) {
    if (x == "-" || x == '+' || x == '*' || x == "/" || x == '%' || x == '=') {
      return true;
    }
    return false;
  }

  void pressEqual() {
    String finalQuestion = userQuestion;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}

class CalculatorColor {
  static final backgroundcolor = Colors.deepPurple[100];
  static const backgroundcolor1 = Colors.deepPurple;
  static final operator = Colors.deepPurple[50];
  static const black = Colors.black;
  static const textcolor = Colors.white;
}
