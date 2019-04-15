import 'package:flutter/material.dart';

import 'package:flutter_36kr/pages/category/character_category.dart';
import 'package:flutter_36kr/pages/category/follow_category.dart';
import 'package:flutter_36kr/pages/category/hot_list_category.dart';
import 'package:flutter_36kr/pages/category/life_category.dart';
import 'package:flutter_36kr/pages/category/news_flash_category.dart';
import 'package:flutter_36kr/pages/category/recommend_category.dart';
import 'package:flutter_36kr/pages/category/technology_category.dart';
import 'package:flutter_36kr/pages/category/video_category.dart';
import 'package:flutter_36kr/pages/category/workplace_category.dart';

import 'package:flutter_36kr/widget/underline_indictor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 9, initialIndex: 1);
  }

  @override
  bool get wantKeepAlive => true; //实现切换tab之后仍然保存在内存中而不销毁

  Widget build(BuildContext context) {
    return NestedScrollView(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          FollowCategory(),
          RecommendCategory(),
          HotListCategory(),
          NewsFlashCategory(),
          VideoCategory(),
          TechnologyCategory(),
          LifeCategory(),
          WorkplaceCategory(),
          CharacterCategory()
        ],
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            leading: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.date_range),
              onPressed: () {},
            ),
            title: Container(
              height: 28.0,
              color: Color(0xfff8f8f8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Color(0xffdddddd),
                    size: 16.0,
                  ),
                  Text(
                    "大家都在搜: AirPods",
                    style: TextStyle(
                      color: Color(0xffdddddd),
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 34.0),
              child: Container(
                height: 34.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TabBar(
                        labelPadding: EdgeInsets.symmetric(horizontal: 15.0),
                        isScrollable: true,
                        indicator: UnderlineIndictor(),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.normal),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.normal),
                        tabs: <Widget>[
                          Tab(
                            text: "关注",
                          ),
                          Tab(
                            text: "推荐",
                          ),
                          Tab(
                            text: "热榜",
                          ),
                          Tab(
                            text: "快讯",
                          ),
                          Tab(
                            text: "视频",
                          ),
                          Tab(
                            text: "科技",
                          ),
                          Tab(
                            text: "生活",
                          ),
                          Tab(
                            text: "职场",
                          ),
                          Tab(
                            text: "人物",
                          )
                        ],
                        controller: _tabController,
                      ),
                    ),
                    Container(
                      height: 34.0,
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.menu),
                          iconSize: 18.0,
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ];
      },
    );
  }
}
