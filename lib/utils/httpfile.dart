import 'dart:convert';

import 'package:fetchnews/models/article.dart';
import 'package:http/http.dart' as http;

Future<List<Articles>> fetchNews() async {
  var response = await http.get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=ab3b6086568c4c00ad6c843bf2aa2cf5"));

  var data = jsonDecode(response.body);

  List<Articles> _articleModelList = [];
  print(response);

  if (response.statusCode == 200) {
    for (var item in data["articles"]) {
      Articles _artcileModel = Articles.fromJson(item);
      _articleModelList.add(_artcileModel);
    }
    return _articleModelList;
  } else {
    return _articleModelList; // empty list
  }
}
