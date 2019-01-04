import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//
class NewsBody1 extends StatefulWidget {
  String url1;
  NewsBody1(this.url1);

  @override
  _NewsBody1State createState() => _NewsBody1State();
}

class _NewsBody1State extends State<NewsBody1> {
  List article;
  String url ;



  Future<String> getNews() async {
    var ref = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var refBody = jsonDecode(ref.body);
      article = refBody["articles"];
    });

    return "Sucess";
  }

  @override
  void initState() {
    url = widget.url1;
    super.initState();
    this.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: article == null ? 0 : article.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Card(
                        child: Text(article[index]['title']),

                      ),
                      padding: EdgeInsets.all(13.0),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}