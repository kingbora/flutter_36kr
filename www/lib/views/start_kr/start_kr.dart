import 'package:flutter/material.dart';

class StartKr extends StatefulWidget {
  @override
  _StartKrState createState() => _StartKrState();
}

class _StartKrState extends State<StartKr> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true; //实现切换tab之后仍然保存在内存中而不销毁

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