import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(
    new MaterialApp(
      home: MyButton(),
    ),
  );
}

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  String flutterText = "";
  int index = 0;
  List<String> collections = ["Futter", "es", "genial"];
  void onPressButton() {
    setState(() {
      flutterText = collections[index];
      if (index < 2) {
        index++;
      } else {
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = new TextStyle(
      fontSize: 40.0,
      foreground: Paint()
        ..shader = ui.Gradient.linear(
          const Offset(10, 20),
          const Offset(200, 140),
          <Color>[
            Colors.black,
            Colors.white,
          ],
        ),
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Stateful Widget",
          style: textStyle,
        ),
        backgroundColor: Colors.pink[300],
      ),
      body: new Container(
        child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                flutterText,
                style: new TextStyle(fontSize: 40.0),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new RaisedButton(
                padding: EdgeInsets.all(5.0),
                child: new Column(
                  children: <Widget>[
                    Text("Actualizar"),
                    Icon(
                      Icons.autorenew,
                      color: Colors.white,
                    ),
                  ],
                ),
                color: Colors.pinkAccent,
                onPressed: onPressButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
