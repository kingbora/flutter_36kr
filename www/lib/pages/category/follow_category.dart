import 'package:flutter/material.dart';

class FollowCategory extends StatefulWidget {
  @override
  _FollowCategoryState createState() => _FollowCategoryState();
}

class _FollowCategoryState extends State<FollowCategory> with AutomaticKeepAliveClientMixin {
@override
  bool get wantKeepAlive => true; //实现切换tab之后仍然保存在内存中而不销毁

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("FollowCategory"),
      ),
    );
  }
}