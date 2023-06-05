import 'dart:convert';

import 'package:football_app/model/Classes.dart';
import 'package:http/http.dart' as http;

class GlobalModel {
  getnews({required String country, String? category}) async {
    String mainLink = 'https://newsapi.org/v2/top-headlines';
    String key = '5a9e30920fe64670884c7c419ed1759f';
    Uri url = Uri.parse(
        '$mainLink?country=$country&category=${category??'general'}&apiKey=$key');
    http.Response response = await http.get(url);

    // Map<String, dynamic> data = jsonDecode(response.body);
    Articles articles = articlesFromJson(response.body);
    return articles;
  }

}
