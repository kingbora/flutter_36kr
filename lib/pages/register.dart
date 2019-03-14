import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("注册"),
        ),
      ),
    );
  }
}
