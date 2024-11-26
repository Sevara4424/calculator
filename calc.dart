import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
 /* final TextEditingController _txt=TextEditingController(text:"0");
  String _a= '';
  String _b= '';
  String _oper= '';
  double _result= 0;
 
  void calculate(){
    double a = double.parse(_a);
    double b = double.parse(_b);
    switch(_oper) {
      case '+':
        _result = (a + b).toString();
        break;
      case '-':
        _result = (a - b).toString();
        break;
      case 'x':
        _result = (a * b).toString();
        break;
      case '/':
        if (b != 0) {
          _result = (a / b).toString();
        } else {
          _result = 'Can\'t divide by zero';
        }
        break;
    }
    _txt.text = _result;
    _oper = '';
    _a = '';
    _b = '';
  }

  void btnPressed(String btnText){
    if(btnText=='C'){
      _txt.text='0';
    }
    else if (btnText== '+' || btnText== '-'|| btnText== '*' || btnText== '/'){
      _oper= btnText;
    } else if(btnText=='='){
      double a=double.parse(_a);
      double b=double.parse(_b);
        switch(_oper) {
      case '+':
        _result = (a + b).toString();
        break;
      case '-':
        _result = (a - b).toString();
        break;
      case 'x':
        _result = (a * b).toString();
        break;
      case '/':
        if (b != 0) {
          _result = (a / b).toString();
        } else {
          _result = 'Can\'t divide by zero';
        }
        break;
      }
      _txt.text = _result;
      _oper = '';
      _a = '';
      _b = '';
  }



    } else {
      if(_oper == ''){
        _a += btnText;
        _txt.text = _a;
      } else{
        _b += btnText;
        _txt.text = _b;
      }
    }
  }*/

  Widget createButton(String btnText, Color textColor, Color bgColor, {double fSize = 30}) {
    return Container(
      //onPressed:()=> btnPressed(btnText),
      height: 60, // Smaller button height
      width: 60, // Smaller button width
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        
      ),
      child: Center(
        child: Text(
          btnText,
          style: TextStyle(
            color: textColor,
            fontSize: fSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget createNumberButton(String btnText, Color textColor, {double fSize = 30}) {
    return GestureDetector(
      onTap: () {
        // Handle button press logic
      },
      child: Center(
        child: Text(
          btnText,
          style: TextStyle(
            color: textColor,
            fontSize: fSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        title: const Text(
          'A simple calculator app',
          style: TextStyle(color: Colors.white,
          fontSize:40,
          fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 244, 184, 204),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              //controller: _txt,
              readOnly: true,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
              ),
              maxLength: 18,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16.0),
              crossAxisCount: 4,
              crossAxisSpacing: 8.0, // Reduced spacing between buttons
              mainAxisSpacing: 8.0, // Reduced spacing between rows
              children: <Widget>[
                // Special buttons with background and border
                createButton('C', Colors.black, const Color.fromARGB(255, 207, 205, 205)),
                createButton('CE', Colors.black, const Color.fromARGB(255, 207, 205, 205)),
                createButton('%', Colors.black, const Color.fromARGB(255, 207, 205, 205)),
                createButton('÷', Colors.white, const Color.fromARGB(221, 238, 62, 62)),

                // Number buttons without background or border
                createNumberButton('7', Colors.black),
                createNumberButton('8', Colors.black),
                createNumberButton('9', Colors.black),
                createButton('×', Colors.white, const Color.fromARGB(221, 238, 62, 62)),

                createNumberButton('4', Colors.black),
                createNumberButton('5', Colors.black),
                createNumberButton('6', Colors.black),
                createButton('-', Colors.white, const Color.fromARGB(221, 238, 62, 62)),

                createNumberButton('1', Colors.black),
                createNumberButton('2', Colors.black),
                createNumberButton('3', Colors.black),
                createButton('+', Colors.white, const Color.fromARGB(221, 238, 62, 62)),

                const SizedBox.shrink(), // Blank space
                createNumberButton('0', Colors.black),
                const SizedBox.shrink(), // Blank space
                createButton('=', Colors.white, const Color.fromARGB(221, 238, 62, 62)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


