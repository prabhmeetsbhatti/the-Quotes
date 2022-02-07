import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:two_sides_app/Models/news_data.dart';

import 'package:http/http.dart' as http;

class NewsProvider extends ChangeNotifier {
  List<NewsData> newsData = [];
  bool isLoading = true;

  Future<void> getNews() async {
    try {
      final response = await http
          .get(Uri.parse('http://164.90.182.80:1337/news'))
          .timeout(const Duration(seconds: 10));
      // final response = await http
      //     .get(Uri.parse(
      //         'http://backend.thequotes.studio-m.mi.hs-offenburg.de/news'))
      //     .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        setLoading(false);

        newsData = newsDataFromJson(response.body);
      } else {
        throw Exception('Unexpected error occured!');
      }
    } on Exception catch (e) {
      log(e.toString());
      setLoading(false);
      newsData = [];
    }
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
  }
}
