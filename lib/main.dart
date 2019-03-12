import 'package:flutter/material.dart';

import 'package:flutter_36kr/views/home_page/home_page.dart';
import 'package:flutter_36kr/views/discovery/discovery.dart';
import 'package:flutter_36kr/views/start_kr/start_kr.dart';
import 'package:flutter_36kr/views/venture_capital/venture_capital.dart';
import 'package:flutter_36kr/views/mine/mine.dart';

import 'package:flutter_36kr/constants/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAppEntry(),
    );
  }
}

class MyAppEntry extends StatefulWidget {
  @override
  _MyAppEntryState createState() => _MyAppEntryState();
}

class _MyAppEntryState extends State<MyAppEntry> {
  int _selectedIndex = 0;

  final _navigationPageItems = [
    HomePage(),
    StartKr(),
    Discovery(),
    VentureCapital(),
    Mine()
  ];

  List<BottomNavigationBarItem> _navigationBarItems = [
    BottomNavigationBarItem(
      title: Text("首页", style:TextStyle(color: AppColor.bottomBarItemColor)),
      icon: Icon(Icons.home, color: AppColor.bottomBarItemColor),
      activeIcon: Icon(Icons.home, color: AppColor.bottomBarItemActiveColor)
    ),
    BottomNavigationBarItem(
      title: Text("开氪", style:TextStyle(color: AppColor.bottomBarItemColor)),
      icon: Icon(Icons.map, color: AppColor.bottomBarItemColor),
      activeIcon: Icon(Icons.map, color: AppColor.bottomBarItemActiveColor)
    ),
    BottomNavigationBarItem(
      title: Text("发现", style:TextStyle(color: AppColor.bottomBarItemColor)),
      icon: Icon(Icons.toys, color: AppColor.bottomBarItemColor),
      activeIcon: Icon(Icons.toys, color: AppColor.bottomBarItemActiveColor)
    ),
    BottomNavigationBarItem(
      title: Text("创投", style:TextStyle(color: AppColor.bottomBarItemColor)),
      icon: Icon(Icons.face, color: AppColor.bottomBarItemColor),
      activeIcon: Icon(Icons.face, color: AppColor.bottomBarItemActiveColor)
    ),
    BottomNavigationBarItem(
      title: Text("我的", style:TextStyle(color: AppColor.bottomBarItemColor)),
      icon: Icon(Icons.android, color: AppColor.bottomBarItemColor),
      activeIcon: Icon(Icons.android, color: AppColor.bottomBarItemActiveColor)
    )
  ];

  void initState() {
    super.initState();
  }

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
