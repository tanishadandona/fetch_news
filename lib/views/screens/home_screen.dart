import 'dart:convert';

import 'package:fetchnews/utils/httpfile.dart';
import 'package:fetchnews/utils/httpfile.dart';
import 'package:flutter/material.dart';

import '../../models/articleModel.dart';
import '../../utils/httpfile.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticlesModel> newsHeadlines = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  String getCurrentDate() {
    var now = new DateTime.now();
    return "${now.year}-${now.month}-${now.day}";
  }

  Future fetchNews() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=4416e948017a48849c5d100f1f28d83a"));

    if (response.statusCode == 200) {
      var newsHeadlines = json.decode(response.body);
      print("news ---$newsHeadlines");
      print(response.body);
      List articles = newsHeadlines["articles"];
      articles.forEach((article) {
        article = ArticlesModel.fromJson(article);
        print("articlesss$article");
        setState(() {
          this.newsHeadlines.add(article);
        });
      });
    } else {
      setState(() {
        loading = false;
      });
    }

    setState(() {
      loading = false;
    });
    return this.newsHeadlines;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Latest News"),
          backgroundColor: Colors.red,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            height: 500,
            child: ListView.builder(
                itemCount: newsHeadlines.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                      newsHeadlines[index].urlToImage == null
                                          ? NetworkImage(
                                              'https://via.placeholder.com/150')
                                          : NetworkImage(
                                              newsHeadlines[index].urlToImage),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text(
                                  newsHeadlines[index].title.toString(),
                                  maxLines: 1,
                                ),
                                subtitle: Column(
                                  children: [
                                    newsHeadlines[index].description != null
                                        ? Text(newsHeadlines[index].description,
                                            maxLines: 3)
                                        : Container(),
                                  ],
                                ),
                                //contentPadding: EdgeInsets.all(4),

                                onTap: () => {},
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.radio,
                                        size: 20,
                                        color: Colors.grey.shade500,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        newsHeadlines[index].author,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        color: Colors.grey.shade500,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        newsHeadlines[index]
                                            .publishedAt
                                            .split("t")[0],
                                        maxLines: 2,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )));
                })),
      ),
    );
  }
}
