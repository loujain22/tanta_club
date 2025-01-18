import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../helpers/keys.dart';
import 'user_provider.dart';

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

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      final url = Uri.parse(BaseUrl.login);
      debugPrint('Attempting login for user: $email');

      final requestBody = {
        'usr': email,
        'pwd': password,
        'phone': email,
      };

      final response = await http.post(
        url,
        headers: ApiKeys.loginHeaders,
        body: json.encode(requestBody),
      );

      debugPrint('Login response status: ${response.statusCode}');
      debugPrint('Raw response body: ${response.body}');

      final responseData = json.decode(response.body);
      debugPrint('Decoded response data: $responseData');

      if (responseData['exception'] != null) {
        final errorMessage =
            responseData['exception'].toString().split(':').last.trim();
        debugPrint('Login failed with exception: $errorMessage');
        throw Exception(errorMessage);
      }

      if (response.statusCode != 200) {
        final error = responseData['message'] ?? 'Authentication failed';
        debugPrint('Login failed: $error');
        throw Exception(error);
      }

      // Extract token from the correct response structure
      debugPrint('Checking message field: ${responseData['message']}');
      if (responseData['message'] != null) {
        final messageData = responseData['message'];
        debugPrint('Message data: $messageData');

        // Combine api_key and api_secret for the token
        _token = '${messageData['api_key']}:${messageData['api_secret']}';
        _userId = messageData['user'];
        _userName = messageData['user']
            .toString()
            .split('@')[0]; // Extract username part
        _expiryDate = DateTime.now().add(const Duration(hours: 24));

        debugPrint('Token set to: $_token');
        debugPrint('UserId set to: $_userId');
        debugPrint('UserName set to: $_userName');

        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode({
          'token': _token,
          'userId': _userId,
          'userName': _userName,
          'expiryDate': _expiryDate!.toIso8601String(),
        });
        await prefs.setString('userData', userData);
        debugPrint('Login successful for user: $_userName');

        // Fetch user info after successful login
        await Provider.of<UserProvider>(context, listen: false)
            .fetchUserInfo(context);

        _autoLogout();
        notifyListeners();
        return true;
      } else {
        throw Exception('Invalid response format');
      }
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
        return false;
      }

      _token = extractedUserData['token'];
      _userId = extractedUserData['userId'];
      _userName = extractedUserData['userName'];
      _expiryDate = expiryDate;

      notifyListeners();
      _autoLogout();
      return true;
    } catch (error) {
      debugPrint('Auto login error: $error');
      return false;
    }
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _userName = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
