import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../presentation/installments/installment.dart';


class InstallmentProvider with ChangeNotifier {
  List<Installment> _installments = [];
  bool _isLoading = false;
  String? _error;

  List<Installment> get installments => [..._installments];
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchInstallments() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final url = Uri.parse(
          'https://v15.trackintltrade.com/api/method/cms_cloud.cloud_membership_finance.api.get_member_installments');

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'token 60554d679fb0920:a3e2282bb421746',
          'Cookie':
              'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
        },
      );

      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);
        if (extractedData['message']['status'] == 'success') {
          final List<dynamic> installmentsData =
              extractedData['message']['data'];
          _installments = installmentsData
              .map((item) => Installment.fromJson(item))
              .toList();
        } else {
          _error = 'Failed to load installments';
        }
      } else {
        _error = 'Failed to load installments. Status: ${response.statusCode}';
      }
    } catch (error) {
      _error = 'Something went wrong: $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
