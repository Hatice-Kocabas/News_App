import 'dart:convert';

import 'package:news_application/models/articles.dart';
import 'package:http/http.dart' as http;
import 'package:news_application/models/news.dart';
class NewsService {
  static NewsService _singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService() {
    return _singleton;
  }


  static Future<List<Articles>?> getNews() async {
    var url =
        //'http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=f58b94449b4f45b9844a296497a93747';
    'https://newsapi.org/v2/everything?q=apple&from=2022-02-09&to=2022-02-09&sortBy=popularity&apiKey=097028b374f94134bf13b0371dfeb923';
    final response = await http.get(Uri.parse(url));

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }
}
