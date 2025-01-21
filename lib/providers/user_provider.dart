import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanta_club/models/user_model.dart';
import 'package:tanta_club/providers/auth_provider.dart';
import 'package:tanta_club/utils/keys.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String _error = '';

  UserProvider() {
    tryLoadUserInfo(); // Load stored user data when provider is initialized
  }

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchUserInfo(BuildContext context) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      if (!authProvider.isAuth) {
        _error = 'User not authenticated';
        return;
      }

      final url = Uri.parse(
          '${ApiKeys.baseUrl}/api/method/cms_cloud.cloud_membership.api.get_member_info');

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'token ${authProvider.token}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _user = UserModel.fromJson(data);

        // Save user data to local storage
        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('userInfo', json.encode(_user!.toJson()));
        debugPrint('Successfully fetched user info for: ${_user!.memberName}');
      } else {
        _error = 'Failed to fetch user info. Status: ${response.statusCode}';
        debugPrint('Error: $_error');
      }
    } catch (e) {
      _error = 'Error fetching user info: $e';
      debugPrint('Error: $_error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> tryLoadUserInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey('userInfo')) {
        debugPrint('No stored user info found');
        return false;
      }

      final userData = json.decode(prefs.getString('userInfo')!);
      _user = UserModel.fromJson({
        'message': {'data': userData}
      });
      debugPrint('Loaded user info for: $_user');

      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Error loading stored user info: $e');
      return false;
    }
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
