import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_36kr/views/home_page/home_page.dart';
import 'package:flutter_36kr/views/discovery/discovery.dart';
import 'package:flutter_36kr/views/start_kr/start_kr.dart';
import 'package:flutter_36kr/views/venture_capital/venture_capital.dart';
import 'package:flutter_36kr/views/mine/mine.dart';

import 'package:flutter_36kr/constants/theme.dart';

import 'package:flutter_36kr/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    //配置路由
    final router = new Router();
    Routes.configureRoutes(router);
    //将路由放置全局变量上
    Routes.routes = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //关于ThemeData详情可见docs/ThemeData.md
      theme: MyTheme.androidTheme,
      home: MyAppEntry(),
      onGenerateRoute: Routes.routes.generator,
    );
  }
}

class MyAppEntry extends StatefulWidget {
  @override
  _MyAppEntryState createState() => _MyAppEntryState();
}

class _MyAppEntryState extends State<MyAppEntry>
    with SingleTickerProviderStateMixin {
  //当前对应的tab索引
  int _selectedIndex = 0;
  TabController _tabController;

  //每个tab页对应的页面
  final _navigationPageItems = [
    HomePage(),
    StartKr(),
    Discovery(),
    VentureCapital(),
    Mine()
  ];

  @override
  void initState() {
    super.initState();
    print(_navigationPageItems.length);
    _tabController = TabController(
      length: 5,
      initialIndex: _selectedIndex,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //当tab点击时,更新索引
  void _onItemTapped(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigationPageItems[_selectedIndex],
      bottomNavigationBar: Container(
        height: 56.0,
        width: double.infinity,
        child: TabBar(
          tabs: <Widget>[
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.home),
                  Container(
                    child: Text("主页"),
                  )
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.access_time),
                  Container(
                    child: Text("开氪"),
                  )
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.explore),
                  Container(
                    child: Text("发现"),
                  )
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.show_chart),
                  Container(
                    child: Text("创投"),
                  )
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.person_outline),
                  Container(
                    child: Text("我的"),
                  )
                ],
              ),
            ),
          ],
          controller: _tabController,
          onTap: _onItemTapped,
          indicatorWeight: 0.00001,
          labelColor: Color(0xff000000),
          unselectedLabelColor: Color(0xff999999),
        ),
      ),
    );
  }
}
