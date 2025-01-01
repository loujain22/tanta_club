import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';
import '../utils/keys.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> _news = [];
  bool _isLoading = false;
  String _error = '';

  List<NewsModel> get news => _news;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchNews() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final url = Uri.parse('${ApiKeys.baseUrl}/api/resource/Member News?fields=["*"]&filters=[["ready","=",1]]');
      debugPrint('Fetching news from: $url');
      
      final response = await http.get(url, headers: ApiKeys.headers);
      debugPrint('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['data'] != null) {
          _news = (data['data'] as List)
              .map((item) => NewsModel.fromJson(item))
              .toList();
          debugPrint('Successfully fetched ${_news.length} news items');
        } else {
          _error = 'No news data found in response';
          debugPrint('Error: $_error');
        }
      } else {
        _error = 'Failed to fetch news. Status code: ${response.statusCode}';
        debugPrint('Error: $_error\nResponse: ${response.body}');
      }
    } catch (e) {
      _error = 'Error fetching news: $e';
      debugPrint('Error: $_error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
