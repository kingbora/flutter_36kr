import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_36kr/utils/HttpUtil.dart';

class RecommendCategory extends StatefulWidget {
  @override
  _RecommendCategoryState createState() => _RecommendCategoryState();
}

class _RecommendCategoryState extends State<RecommendCategory> {
  List data;

  void initState() {
    super.initState();
  }

  Future get() async {
    var instance = HttpUtil.getInstance();
    return await instance.get("/getArticleList");
  }

  Future loadData() async {
    await get();
    if (!mounted) return;
    setState(() {});
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    print(snapshot.data);
    List values = snapshot.data != null ? snapshot.data : [];

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      itemCount: values == null ? 0 : values.length,
      itemBuilder: (BuildContext context, int i) {
        return _listRow(values[i]);
      },
    );
  }

  Widget _listRow(listItem) {
    return InkWell(
      child: Container(
        height: 90.0,
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 60.0,
                      child: Text(
                        listItem['title'],
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          listItem['author'] + " · 3分钟前",
                          style: TextStyle(
                            color: Color(0xffcccccc),
                            fontSize: 11.0,
                          ),
                        ),
                        Text(
                          listItem['favorite'].toString() + "收藏",
                          style: TextStyle(
                            color: Color(0xffcccccc),
                            fontSize: 11.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Image.network(
              listItem['avatar'],
              width: 90.0,
              height: 90.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: FutureBuilder(
        future: get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return new Center(
                child: Text("loadding"),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else {
                return createListView(context, snapshot);
              }
          }
        },
      ),
      onRefresh: loadData,
    );
  }
}
