import 'package:flutter/material.dart';

import 'package:flutter_36kr/stores/stores.dart';
import 'package:flutter_36kr/routes/routes.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true; //实现切换tab之后仍然保存在内存中而不销毁

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("登录"),
          onPressed: () {
            Window.router.navigateTo(context, Routes.login);
          },
        ),
      ),
    );
  }
}