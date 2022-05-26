import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/articleModel.dart';

class HttpUtils {
//  Future<List<ArticlesModel>?> getArticles() async {
//     try {
//       List<ArticlesModel> articles = [];

//       final res = await http.get(Uri.parse(
//           "https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=4416e948017a48849c5d100f1f28d83a"));

//       if (res.statusCode == 200) {
//         var data = jsonDecode(res.body);
//         print("dataaaaaaa here$data");
//         var rowArticles = data['articles'];

//         for (var item in rowArticles['articles']) {
//           ArticlesModel articleob = ArticlesModel.fromJson(item);

//           articles.add(articleob);
//         }
//         return articles;
//       } else {
//         return [];
//       }
//     } catch (e) {
//       Text("Error");
//     }
//   }
}
