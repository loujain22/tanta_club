import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/events_model.dart';
import '../utils/keys.dart';

class EventsProvider with ChangeNotifier {
  List<EventsModel> _events = [];
  bool _isLoading = false;
  String _error = '';

  List<EventsModel> get events => _events;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchEvents() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final url = Uri.parse('${ApiKeys.eventsEndpoint}?fields=["*"]&filters=[["ready","=",1]]');
      debugPrint('Fetching events from: $url');
      
      final response = await http.get(url, headers: ApiKeys.headers);
      debugPrint('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['data'] != null) {
          _events = (data['data'] as List)
              .map((item) => EventsModel.fromJson(item))
              .toList();
          debugPrint('Successfully fetched ${_events.length} events');
        } else {
          _error = 'No events data found in response';
          debugPrint('Error: $_error');
        }
      } else {
        _error = 'Failed to fetch events. Status code: ${response.statusCode}';
        debugPrint('Error: $_error\nResponse: ${response.body}');
      }
    } catch (e) {
      _error = 'Error fetching events: $e';
      debugPrint('Error: $_error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
