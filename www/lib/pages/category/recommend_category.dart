import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_36kr/utils/HttpUtil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class RecommendCategory extends StatefulWidget {
  @override
  _RecommendCategoryState createState() => _RecommendCategoryState();
}

class _RecommendCategoryState extends State<RecommendCategory>
    with AutomaticKeepAliveClientMixin {

  List<Widget> imageList = List();

  @override
  bool get wantKeepAlive => true; //实现切换tab之后仍然保存在内存中而不销毁

  void initState() {
    super.initState();

    imageList..add(Image.asset("assets/images/banner1.jpg", fit: BoxFit.cover,))
    ..add(Image.asset("assets/images/banner2.jpg", fit: BoxFit.cover,))
    ..add(Image.asset("assets/images/banner3.jpg", fit: BoxFit.cover,));
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
      itemCount: values == null ? 0 : values.length + 1,
      itemBuilder: (BuildContext context, int i) {
        if (i == 0) {
          return _buildCarousel();
        } else {
          return _listRow(values[i]);
        }
      },
    );
  }

  Widget _buildCarousel() {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      child: Swiper(
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return imageList[index];
        },
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.blueAccent,
          )
        ),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点了第$index'),
      ),
    );
  }

  Widget _listRow(listItem) {
    return InkWell(
      child: Container(
        height: 90.0,
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
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
            Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(listItem['avatar'])
                )
              ),
            )
          ],
        ),
      ),
      highlightColor: Color(0xffeeeeee),
      onTap: () {

      },

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
