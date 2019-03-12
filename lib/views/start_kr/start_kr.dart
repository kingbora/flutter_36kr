import 'package:flutter/material.dart';

class StartKr extends StatefulWidget {
  @override
  _StartKrState createState() => _StartKrState();
}

class _StartKrState extends State<StartKr> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("开氪"),
      ),
      body: Center(
        child: Text("开氪"),
      ),
    );
  }
}