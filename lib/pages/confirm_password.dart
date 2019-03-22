import 'package:flutter/material.dart';

class ConfirmPassword extends StatefulWidget {
  _ConfirmPasswordState createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("密码设置"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("密码设置"),
        ),
      ),
    );
  }
}
