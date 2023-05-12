import 'dart:convert';
import 'package:http/http.dart';
import '../model/article_model.dart.';

class Apiservice {
  final endpoint = "https://newsapi.org/v2/everything?q=tesla&from=2023-04-08&sortBy=publishedAt&apiKey=cbfd756aae624b60b552db55c9d65612";
  Future<List<Article>> getArticle() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> article =
      body.map((dynamic item) => Article.fromjson(item)).toList();
      return article;
    } else {
      throw "Data not Fetched...";
    }
  }
}