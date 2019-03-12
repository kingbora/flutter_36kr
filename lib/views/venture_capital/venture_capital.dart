import 'package:flutter/material.dart';

class VentureCapital extends StatefulWidget {
  @override
  _VentureCapitalState createState() => _VentureCapitalState();
}

class _VentureCapitalState extends State<VentureCapital> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("创投"),
      ),
      body: Center(
        child: Text("创投"),
      ),
    );
  }
}