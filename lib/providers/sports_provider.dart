import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/keys.dart';
import '../models/sport_model.dart';

class SportsProvider with ChangeNotifier {
  List<SportModel> _sports = [];
  bool _isLoading = false;
  String _error = '';
  SportModel? _selectedSport;

  List<SportModel> get sports => [..._sports];
  bool get isLoading => _isLoading;
  String get error => _error;
  SportModel? get selectedSport => _selectedSport;

  List<SportModel> get activeSports =>
      _sports.where((sport) => sport.isActive).toList();

  Future<void> fetchSports(BuildContext context) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final url = Uri.parse(ApiKeys.sportsEndpoint);

      // final url = Uri.parse('${ApiKeys.baseUrl}/api/resource/Sport Cloud?fields=["*"]');
      debugPrint('Fetching sports from: $url');

      final response = await http.get(
        url,
        headers: ApiKeys.getAuthHeaders(context),
      );
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['data'] != null) {
          _sports = (data['data'] as List)
              .map((item) => SportModel.fromJson(item))
              .toList();
          debugPrint('Successfully fetched ${_sports.length} sports');
        } else {
          _error = 'No sports data found in response';
          debugPrint('Error: $_error');
        }
      } else {
        _error = 'Failed to fetch sports. Status code: ${response.statusCode}';
        debugPrint('Error: $_error\nResponse: ${response.body}');
      }
    } catch (e) {
      _error = 'Error fetching sports: $e';
      debugPrint('Error: $_error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchSportDetails(String sportId, BuildContext context) async {
    try {
      final url = Uri.parse(
          '${ApiKeys.baseUrl}/api/resource/Sport Cloud/$sportId?fields=["*"]');
      debugPrint('Fetching sport details for ID $sportId');

      final response = await http.get(
        url,
        headers: ApiKeys.headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['data'] != null) {
          _selectedSport = SportModel.fromJson(data['data']);
          debugPrint(
              'Successfully fetched details for sport: ${_selectedSport?.name}');
        } else {
          throw Exception('No sport details found');
        }
      } else {
        throw Exception('Failed to fetch sport details');
      }
    } catch (e) {
      debugPrint('Error fetching sport details: $e');
      rethrow;
    }
    notifyListeners();
  }

  void clearSelectedSport() {
    _selectedSport = null;
    notifyListeners();
  }

  // Search sports by name
  List<SportModel> searchSports(String query) {
    if (query.isEmpty) return _sports;

    return _sports
        .where((sport) => sport.name.toLowerCase().contains(query.toLowerCase())
            // sport.description.toLowerCase().contains(query.toLowerCase())
            )
        .toList();
  }
}
