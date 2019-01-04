import 'package:flutter/material.dart';

import './news_body.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewBody(),
    );
  }
}

class NewBody extends StatefulWidget {
  @override
  _NewBodyState createState() => _NewBodyState();
}

class _NewBodyState extends State<NewBody> with SingleTickerProviderStateMixin {
  TabController t1;
  TabBarView _tabbarview;
  TabBar _tabBar;
  static String url1 =
      "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=f9a164debafd40cb9eff74e23afce225";
  static String url2 = 'https://newsapi.org/v2/top-headlines?'
      'country=us&apiKey=f9a164debafd40cb9eff74e23afce225';
  static String url3 =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f9a164debafd40cb9eff74e23afce225";
  static String url4 =
      "https://newsapi.org/v2/everything?q=apple&from=2019-01-03&to=2019-01-03&sortBy=popularity&apiKey=f9a164debafd40cb9eff74e23afce225";
  @override
  void initState() {
    t1 = TabController(
      length: 4,
      vsync: this,
    );
    super.initState();

    _tabbarview = TabBarView(controller: t1, children: [
      NewsBody1(url1),
      NewsBody1(url2),
      NewsBody1(url3),
      NewsBody1(url4),
    ]);

    _tabBar = TabBar(
      controller: t1,
      tabs: <Widget>[
        giveTab(Icons.apps),
        giveTab(Icons.new_releases),
        giveTab(Icons.timelapse),
        giveTab(Icons.link),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The News App Project"),
        bottom: _tabBar,
      ),
      body: _tabbarview,
    );
  }

  giveTab(IconData apps) {
    return Tab(
      icon: Icon(apps),
    );
  }
}
