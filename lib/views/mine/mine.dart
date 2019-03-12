import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Center(
        child: Text("我的"),
      ),
    );
  }
}