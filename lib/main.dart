import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_36kr/views/home_page/home_page.dart';
import 'package:flutter_36kr/views/discovery/discovery.dart';
import 'package:flutter_36kr/views/start_kr/start_kr.dart';
import 'package:flutter_36kr/views/venture_capital/venture_capital.dart';
import 'package:flutter_36kr/views/mine/mine.dart';

import 'package:flutter_36kr/constants/theme.dart';

import 'package:flutter_36kr/routes/routes.dart';
import 'package:flutter_36kr/stores/stores.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    //配置路由
    final router = new Router();
    Routes.configureRoutes(router);
    //将路由放置全局变量上
    Window.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //关于ThemeData详情可见docs/ThemeData.md
      theme: MyTheme.androidTheme,
      home: MyAppEntry(),
      onGenerateRoute: Window.router.generator,
    );
  }
}

class MyAppEntry extends StatefulWidget {
  @override
  _MyAppEntryState createState() => _MyAppEntryState();
}

class _MyAppEntryState extends State<MyAppEntry> {
  //当前对应的tab索引
  int _selectedIndex = 0;

  //每个tab页对应的页面
  final _navigationPageItems = [
    HomePage(),
    StartKr(),
    Discovery(),
    VentureCapital(),
    Mine()
  ];

  //底部导航的tab
  List<BottomNavigationBarItem> _navigationBarItems = [
    BottomNavigationBarItem(
      title: Text("首页"),
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      title: Text("开氪"),
      icon: Icon(Icons.access_time),
    ),
    BottomNavigationBarItem(
      title: Text("发现"),
      icon: Icon(Icons.explore),
    ),
    BottomNavigationBarItem(
      title: Text("创投"),
      icon: Icon(Icons.show_chart),
    ),
    BottomNavigationBarItem(
      title: Text("我的"),
      icon: Icon(Icons.person_outline),
    )
  ];

  //当tab点击时,更新索引
  void _onItemTapped(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigationPageItems.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationBarItems,
        currentIndex: _selectedIndex,
        type:BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
