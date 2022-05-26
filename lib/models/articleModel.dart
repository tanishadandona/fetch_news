import 'package:fetchnews/models/source.dart';
import 'package:intl/intl.dart';

class ArticlesModel {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  ArticlesModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

 factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
      source: Source.fromJson(json["source"]),
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt :json["publishedAt"],
      content: json["content"]);
}
