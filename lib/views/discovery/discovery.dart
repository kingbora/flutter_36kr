import 'package:flutter/material.dart';

class Discovery extends StatefulWidget {
  @override
  _DiscoveryState createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true; //实现切换tab之后仍然保存在内存中而不销毁

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