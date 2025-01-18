import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class ApiKeys {
  static const String baseUrl = 'https://v15.trackintltrade.com';

  // API Endpoints
  static const String newsEndpoint =
      '$baseUrl/api/resource/Member News?fields=["*"]&filters=[["ready","=",1]]&&order_by=creation desc';
  static const String eventsEndpoint =
      '$baseUrl/api/resource/Member Events?fields=["*"]&filters=[["ready","=",1]]&&order_by=creation desc';
  static const String sportsEndpoint =
      '$baseUrl/api/resource/Sport Cloud?fields=["*"]';
  static const String sportDetailsEndpoint =
      '$baseUrl/api/resource/Sport Cloud/';

  static Map<String, String> get headers => {
        'Authorization': 'token 6752561e9b638a6:6490c27487543cd',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

  // static Map<String, String> get imageHeaders => {
  //   'Authorization': 'token 6752561e9b638a6:6490c27487543cd',
  // };

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
    print(token);
    print("token");

    return {
      'Authorization': 'token $token',
    };
  }
}
