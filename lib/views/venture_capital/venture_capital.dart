import 'package:flutter/material.dart';

class VentureCapital extends StatefulWidget {
  @override
  _VentureCapitalState createState() => _VentureCapitalState();
}

class _VentureCapitalState extends State<VentureCapital> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true; //实现切换tab之后仍然保存在内存中而不销毁

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