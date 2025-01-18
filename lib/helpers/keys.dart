import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class BaseUrl {
  static const String baseUrl = "https://v15.trackintltrade.com";
  static const String baseApi = "$baseUrl/api/resource";
  static const String baseMethodApi = "$baseUrl/api/method";

  // Auth endpoints
  static const String login =
      "$baseMethodApi/cms_cloud.cms_auth.auth_client.login";

  // Payment endpoints
  static const String processPayment =
      "$baseMethodApi/cms_cloud.cms_cloud.online_payment.process_payment";
  static const String checkPaymentStatus =
      "$baseMethodApi/cms_cloud.cms_cloud.online_payment.check_payment_status";
}

class ApiKeys {
  static const String baseUrl = BaseUrl.baseUrl;
  static const String authToken = '6752561e9b638a6:6490c27487543cd';

  // Static headers for login
  static Map<String, String> get loginHeaders => {
        'Authorization': 'token $authToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

  static Map<String, String> getAuthHeaders(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final token = authProvider.token;

    return {
      'Authorization': 'token $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  static Map<String, String> getAuthImageHeaders(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final token = authProvider.token;

    return {
      'Authorization': 'token $token',
    };
  }
}
