import 'package:flutter/material.dart';

class Discovery extends StatefulWidget {
  @override
  _DiscoveryState createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发现"),
      ),
      body: Center(
        child: Text("发现"),
      ),
    );
  }
}