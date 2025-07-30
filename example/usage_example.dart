import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Pigment Example',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Pigment.fromString("blue"),
      appBar: new AppBar(
        title: new Text("Pigment Example"),
      ),
      body: new Center(
        child: new Text(
          'Hello, World!',
          style: new TextStyle(
            color: Pigment.fromCSSColor(CSSColor.lightgoldenrodyellow),
          ),
        ),
      ),
    );
  }
}
