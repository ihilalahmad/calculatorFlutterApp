
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int firstNum;
  int secondNum;
  String textToDisplay = "";
  String result;
  String operatorToPerform;

  void btnClicked(String btnValue){
    if(btnValue == "C"){
      textToDisplay = "";
      firstNum = 0;
      secondNum = 0;
      result = "";
    } else if (btnValue == "+" || btnValue == "-" || btnValue == "x" || btnValue == "/"){
      firstNum = int.parse(textToDisplay);
      result = "";
      operatorToPerform = btnValue;
    } else if(btnValue == "="){
      secondNum = int.parse(textToDisplay);
      if(operatorToPerform == "+"){
        result = (firstNum + secondNum).toString();
      }
      if(operatorToPerform == "-"){
        result = (firstNum - secondNum).toString();
      }
      if(operatorToPerform == "x"){
        result = (firstNum * secondNum).toString();
      }
      if(operatorToPerform == "/"){
        result = (firstNum ~/ secondNum).toString();
      }
    } else {
      result = int.parse(textToDisplay + btnValue).toString();
    }

    setState(() {
      textToDisplay = result;
    });
  }

  Widget customButton(String btnValue){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(20.0),
        onPressed: () => btnClicked(btnValue),
        textColor: Colors.black,
        child: Text(
          "$btnValue",
          style: TextStyle(
            fontSize: 25.0
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Calculator App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$textToDisplay",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              customButton("9"),
              customButton("8"),
              customButton("7"),
              customButton("+")
            ],
          ),
          Row(
            children: <Widget>[
              customButton("6"),
              customButton("5"),
              customButton("4"),
              customButton("-")
            ],
          ),
          Row(
            children: <Widget>[
              customButton("3"),
              customButton("2"),
              customButton("1"),
              customButton("x")
            ],
          ),
          Row(
            children: <Widget>[
              customButton("C"),
              customButton("0"),
              customButton("="),
              customButton("/")
            ],
          ),
        ],
      ),
    );
  }
}


