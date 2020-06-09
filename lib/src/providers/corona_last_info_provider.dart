import 'dart:convert';

import 'package:corona_app/src/models/CoronaLastInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CoronaLastInfoProvider with ChangeNotifier {
  List<CoronaLastInfo> _coronaLastInfos = [];

  List<CoronaLastInfo> get coronaLastInfos => _coronaLastInfos;

  /*Future<List<double>> getAllDeaths() async {
    final response = await http.get('https://corona-api.com/timeline');
    List<double> listData = [];
    final List<double> lastData = [];
    final List<double> updateData = [];
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List<CoronaLastInfo>;
      for (int i = 0; i < 10; i++) {
        updateData.add(data[i].deaths.toDouble());
      }
      for (int i = 10; i < 20; i++) {
        lastData.add(data[i].deaths.toDouble());
      }
    }
    for (int i = 0; i < updateData.length; i++) {
      for (int j = 0; j < lastData.length; i++) {
        listData.add(updateData[i] - lastData[j]);
      }
    }
    _deaths = listData;
    print(listData);
    notifyListeners();
    return listData;
  }*/

  Future<CoronaLastInfo> fetchCoronaLastInfo() async {
    final response = await http.get('https://corona-api.com/timeline');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List<dynamic>;
      final CoronaLastInfo coronaLastInfo = CoronaLastInfo.fromJson(data.first);

      for (int i = 0; i < data.length; i++) {
        _coronaLastInfos.add(CoronaLastInfo.fromJson(data[i]));
        notifyListeners();
      }

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
