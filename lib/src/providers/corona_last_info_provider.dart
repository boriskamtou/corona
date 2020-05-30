import 'dart:convert';

import 'package:corona_app/src/models/CoronaLastInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CoronaLastInfoProvider with ChangeNotifier {
  final List<CoronaLastInfo> _coronaLastInfo = [];

  Future<CoronaLastInfo> fetchCoronaLastInfo() async {
    final response = await http.get('https://corona-api.com/timeline');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List<dynamic>;
      final CoronaLastInfo coronaLastInfo = CoronaLastInfo.fromJson(data.first);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('updated_at', coronaLastInfo.updated_at);
      prefs.setInt('deaths', coronaLastInfo.deaths);
      prefs.setInt('recovered', coronaLastInfo.recovered);
      prefs.setInt('active', coronaLastInfo.active);
      prefs.setInt('new_confirmed', coronaLastInfo.new_confirmed);
      prefs.setInt('new_deaths', coronaLastInfo.new_deaths);
      prefs.setInt('new_recovered', coronaLastInfo.new_recovered);
      prefs.setBool('is_in_progress', coronaLastInfo.is_in_progress);
      return coronaLastInfo;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
