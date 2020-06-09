import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:corona_app/src/models/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const API_KEY = '6e5790f55a864136b1b93689f966fdf9';

class NewsProvider with ChangeNotifier {
  List<News> _news = [];

  List<News> get news => [..._news];

  Future<List<News>> fetchNews() async {
    final response = await http.get(
      'https://newsapi.org/v2/top-headlines?q=corona&pageSize=50',
      headers: {HttpHeaders.authorizationHeader: "$API_KEY"},
    );
    final List<News> loadData = [];

    if (response.statusCode == 200) {
      final result = json.decode(response.body)['articles'] as List<dynamic>;

      result.forEach((jsonData) {
        loadData.add(News.fromJson(jsonData));
      });

      _news = loadData;
      notifyListeners();
    } else {
      throw Exception('Failed to load album');
    }
    return loadData;
  }
}
