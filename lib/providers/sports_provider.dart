import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/sports_model.dart';
import '../utils/keys.dart';

class SportsProvider with ChangeNotifier {
  List<SportsModel> _sports = [];
  bool _isLoading = false;
  String _error = '';
  SportsModel? _selectedSport;

  List<SportsModel> get sports => _sports;
  bool get isLoading => _isLoading;
  String get error => _error;
  SportsModel? get selectedSport => _selectedSport;

  // Getters for filtered sports
  List<SportsModel> get activeSports => _sports.where((sport) => sport.isActive).toList();

  Future<void> fetchSports() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final url = Uri.parse('${ApiKeys.baseUrl}/api/resource/Sports?fields=["*"]&filters=[["ready","=",1]]');
      debugPrint('Fetching sports from: $url');
      
      final response = await http.get(url, headers: ApiKeys.headers);
      debugPrint('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['data'] != null) {
          _sports = (data['data'] as List)
              .map((item) => SportsModel.fromJson(item))
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

  Future<void> fetchSportDetails(int sportId) async {
    try {
      final url = Uri.parse('${ApiKeys.baseUrl}/api/resource/Sports/$sportId?fields=["*"]');
      debugPrint('Fetching sport details for ID $sportId');
      
      final response = await http.get(url, headers: ApiKeys.headers);
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['data'] != null) {
          _selectedSport = SportsModel.fromJson(data['data']);
          debugPrint('Successfully fetched details for sport: ${_selectedSport?.name}');
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
  List<SportsModel> searchSports(String query) {
    if (query.isEmpty) return _sports;
    
    return _sports.where((sport) =>
      sport.name.toLowerCase().contains(query.toLowerCase()) ||
      sport.description.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Filter sports by fee range
  List<SportsModel> filterByFeeRange(double minFee, double maxFee) {
    return _sports.where((sport) =>
      sport.fees >= minFee && sport.fees <= maxFee
    ).toList();
  }

  // Get sports by location
  List<SportsModel> getSportsByLocation(String location) {
    return _sports.where((sport) =>
      sport.location.toLowerCase() == location.toLowerCase()
    ).toList();
  }

  // Get sports by coach
  List<SportsModel> getSportsByCoach(String coach) {
    return _sports.where((sport) =>
      sport.coach.toLowerCase() == coach.toLowerCase()
    ).toList();
  }

  // Get unique locations
  Set<String> get availableLocations {
    return _sports.map((sport) => sport.location).toSet();
  }

  // Get unique coaches
  Set<String> get availableCoaches {
    return _sports.map((sport) => sport.coach).toSet();
  }

  // Get fee range
  Map<String, double> get feeRange {
    if (_sports.isEmpty) return {'min': 0, 'max': 0};
    
    final fees = _sports.map((sport) => sport.fees).toList();
    return {
      'min': fees.reduce((min, fee) => fee < min ? fee : min),
      'max': fees.reduce((max, fee) => fee > max ? fee : max),
    };
  }
}