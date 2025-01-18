import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/keys.dart';
import '../models/events_model.dart';

class EventsProvider with ChangeNotifier {
  List<EventsModel> _events = [];
  bool _isLoading = false;
  String _error = '';

  List<EventsModel> get events => [..._events];
  bool get isLoading => _isLoading;
  String get error => _error;

  // Get the big event if available, otherwise return the first event
  EventsModel? get featuredEvent {
    if (_events.isEmpty) return null;
    return _events.firstWhere(
      (event) => event.isBigEvent,
      orElse: () => _events.first,
    );
  }

  // Get all events except the featured one
  List<EventsModel> get regularEvents {
    if (_events.isEmpty) return [];
    final featured = featuredEvent;
    if (featured == null) return _events;
    return _events.where((event) => event.name != featured.name).toList();
  }

  Future<void> fetchEvents(BuildContext context) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final url = Uri.parse(ApiKeys.eventsEndpoint);

      final response = await http.get(
        url,
        headers: ApiKeys.getAuthHeaders(context),
      );
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

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
