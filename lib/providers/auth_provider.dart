import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../helpers/keys.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  String? _userName;
  Timer? _authTimer;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String? get userId => _userId;
  String? get userName => _userName;

  Future<bool> login(String email, String password) async {
    try {
      final url = Uri.parse(BaseUrl.login);
      debugPrint('Attempting login for user: $email');

      final requestBody = {
        'usr': email,
        'pwd': password,
        'mobile': true,
        'serial': '9e1093961f8ef891'
      };

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'token ${ApiKeys.authToken}'
        },
        body: json.encode(requestBody),
      );

      final responseData = json.decode(response.body);
      debugPrint('Login response status: ${response.statusCode}');
      
      if (responseData['exception'] != null) {
        final errorMessage = responseData['exception'].toString().split(':').last.trim();
        debugPrint('Login failed with exception: $errorMessage');
        throw Exception(errorMessage);
      }
      
      if (response.statusCode != 200) {
        final error = responseData['message'] ?? 'Authentication failed';
        debugPrint('Login failed: $error');
        throw Exception(error);
      }

      _token = responseData['token'];
      _userId = responseData['userId'];
      _userName = responseData['userName'];
      _expiryDate = DateTime.now().add(const Duration(hours: 24));

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userId': _userId,
        'userName': _userName,
        'expiryDate': _expiryDate!.toIso8601String(),
      });
      await prefs.setString('userData', userData);
      debugPrint('Login successful for user: $_userName');

      _autoLogout();
      notifyListeners();
      return true;
    } catch (error) {
      debugPrint('Login error: $error');
      rethrow;
    }
  }

  Future<bool> tryAutoLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey('userData')) {
        debugPrint('No stored user data found');
        return false;
      }

      final extractedUserData = json.decode(prefs.getString('userData')!);
      final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

      if (expiryDate.isBefore(DateTime.now())) {
        debugPrint('Stored token has expired');
        await logout();
        return false;
      }

      _token = extractedUserData['token'];
      _userId = extractedUserData['userId'];
      _userName = extractedUserData['userName'];
      _expiryDate = expiryDate;

      debugPrint('Auto login successful for user: $_userName');
      notifyListeners();
      _autoLogout();
      return true;
    } catch (error) {
      debugPrint('Auto login error: $error');
      return false;
    }
  }

  Future<void> logout() async {
    debugPrint('Logging out user: $_userName');
    _token = null;
    _userId = null;
    _userName = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userData');
    debugPrint('User logged out successfully');
    notifyListeners();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
    debugPrint('Auto logout scheduled in $timeToExpiry seconds');
  }
}
