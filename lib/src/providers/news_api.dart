import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const API_KEY = '6e5790f55a864136b1b93689f966fdf9';

class NewsProvider with ChangeNotifier {
  Future<void> fetchNews() async {
    final response = await http.get(
      'https://jsonplaceholder.typicode.com/albums/1',
      headers: {HttpHeaders.authorizationHeader: "$API_KEY"},
    );
    final result = json.decode(response.body);

    print(result);
  }
}
