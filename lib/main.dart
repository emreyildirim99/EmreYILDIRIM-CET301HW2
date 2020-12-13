import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: EmreYildirimCalculator()));
}

class EmreYildirimCalculator extends StatefulWidget {
  @override
  _EmreYildirimCalculatorState createState() => _EmreYildirimCalculatorState();
}

class _EmreYildirimCalculatorState extends State<EmreYildirimCalculator> {
  //Emre Yıldırım - 11.12.2020

  String number = '0';
  String number2 = '0';
  String temp = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operator = '';
  String dynamicNumber = '';
  bool isFirst = true;


  void onDigitPress(String text) {
    if (text == 'C') {
      //Reset Variables
      number = '0';
      number2 = '0';
      temp = '0';
      num1 = 0.0;
      num2 = 0.0;
      operator = '';
      dynamicNumber = '';
      isFirst = true;

    } else if (text == '⌫') {
      number2 = number2.substring(0, number2.length - 1);
      if (number2 == '') {
        number2 = '0';
      }
    } else if (text == '+' || text == '-' || text == '÷' || text == '×') {
      num1 = double.parse(number);
      if(num1 == 0.0){
        operator = text;
        isFirst = false;
        num1 = double.parse(dynamicNumber);
        temp = dynamicNumber + operator;

      }else{
        operator = text;
        isFirst = false;
        temp = number + operator;
        dynamicNumber = number;
      }

    } else if (text == '=') {
      num2 = double.parse(number);

      if (operator == '+') {
        number2 = (num1 + num2).toString();
        temp = double.parse(number2).toStringAsFixed(1) + operator;
      }

      if (operator == '-') {
        number2 = (num1 - num2).toString();
        temp = double.parse(number2).toStringAsFixed(1) + operator;
      }

      if (operator == '÷') {
        number2 = (num1 / num2).toString();
        temp = double.parse(number2).toStringAsFixed(1) + operator;
      }

      if (operator == '×') {
        number2 = (num1 * num2).toString();
        temp = double.parse(number2).toStringAsFixed(1) + operator;
      }

      num1 = 0.0;
      num2 = 0.0;
      operator = '';

    } else if (text == '.') {
      if (number2.contains('.')) {
        return;
      } else {
        number2 = number2 + text;
      }
    } else {
      if (number2 == '0') {
        number2 = text;
      } else {

        if(!isFirst){
          number2 = text;
          isFirst = true;
        }else{
          number2 = number2 + text;
        }


      }
    }

    setState(() {
      number = double.parse(number2).toStringAsFixed(1);
    });
  }

  Expanded buildCalcButton(String text, Color color, int flexSize) {
    return Expanded(
      flex: flexSize,
      child: FlatButton(
        onPressed: () {
          onDigitPress(text);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Colors.white,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        color: color,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator - Emre YILDIRIM'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
            child: Text(
              '$temp',
              style: TextStyle(
                fontSize: 35.0,
                fontFamily: 'Digital-7',
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
            child: Text(
              '$number',
              style: TextStyle(
                fontSize: 70.0,
                fontFamily: 'Digital-7',
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildCalcButton('C', Colors.redAccent, 2),
                buildCalcButton('⌫', Colors.blue, 1),
                buildCalcButton('÷', Colors.blue, 1),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildCalcButton('7', Colors.black54, 1),
                buildCalcButton('8', Colors.black54, 1),
                buildCalcButton('9', Colors.black54, 1),
                buildCalcButton('×', Colors.blue, 1),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildCalcButton('4', Colors.black54, 1),
                buildCalcButton('5', Colors.black54, 1),
                buildCalcButton('6', Colors.black54, 1),
                buildCalcButton('+', Colors.blue, 1),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildCalcButton('1', Colors.black54, 1),
                buildCalcButton('2', Colors.black54, 1),
                buildCalcButton('3', Colors.black54, 1),
                buildCalcButton('-', Colors.blue, 1),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildCalcButton('.', Colors.black54, 1),
                buildCalcButton('0', Colors.black54, 1),
                buildCalcButton('00', Colors.black54, 1),
                buildCalcButton('=', Colors.blue, 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
