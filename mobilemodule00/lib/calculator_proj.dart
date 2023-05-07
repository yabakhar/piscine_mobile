import 'package:eval_ex/expression.dart';
import 'package:flutter/material.dart';

class CalculatorProj extends StatefulWidget {
  const CalculatorProj({super.key});

  @override
  _CalculatorProjState createState() => _CalculatorProjState();
}

class _CalculatorProjState extends State<CalculatorProj> {
  String output = "0";
  String result = "0";

  buttonPressed(String buttonText) {
    print("button pressed : $buttonText");
    if (output == "Error") {
      result = "0";
      output = "0";
    } else if (buttonText == "C") {
      setState(() {
        if (output.isNotEmpty) {
          output = output.substring(0, output.length - 1);
        }
      });
    } else if (buttonText == "AC") {
      setState(() {
        result = "0";
        output = "0";
      });
    } else if (buttonText == "=") {
      setState(() {
        output = evalExpression(output);
        result = output;
      });
    } else if (output.length > 20) {
      print("Over Length");
    } else {
      setState(() {
        if (output == "0") {
          output = buttonText;
        } else {
          output += buttonText;
        }
      });
    }
  }

  String evalExpression(String expression) {
    try {
      Expression ex = Expression(expression);
      return ex.eval()!.toStringAsFixed(2);
    } catch (e) {
      print(e);
      return "Error";
    }
  }

  late Orientation orientation;
  late Size size;
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Color(0xff607d8b),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: (orientation.index == 0) ? 4 : 2,
              child: Container(
                width: double.infinity,
                color: Color(0xff37474f),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      output,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      result,
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: (orientation.index == 0) ? 5 : 3,
              child: Container(
                color: Color(0xff607d8b),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        buildButton("7"),
                        buildButton("8"),
                        buildButton("9"),
                        buildButton("C"),
                        buildButton("AC"),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton("4"),
                        buildButton("5"),
                        buildButton("6"),
                        buildButton("+"),
                        buildButton("-"),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton("1"),
                        buildButton("2"),
                        buildButton("3"),
                        buildButton("*"),
                        buildButton("/"),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton("0"),
                        buildButton("."),
                        buildButton("00"),
                        buildButton("="),
                        buildButton(""),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Container(
          height: (orientation.index == 0) ? size.height / 11 : null,
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
