import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../helpers/keys.dart';

class PaymentResult {
  final String orderId;
  final String formUrl;

  PaymentResult(this.orderId, this.formUrl);
}

class PaymentVerificationResult {
  final bool isPaid;
  final String errorMessage;
  final double amount;
  final String orderNumber;

  PaymentVerificationResult({
    required this.isPaid,
    required this.errorMessage,
    required this.amount,
    required this.orderNumber,
  });
}

class InvoiceProvider with ChangeNotifier {
  List<dynamic> _invoices = [];
  final Set<String> _selectedInvoices = {};
  bool _isLoading = false;
  String? _error;

  List<dynamic> get invoices => [..._invoices];
  Set<String> get selectedInvoices => {..._selectedInvoices};
  bool get isLoading => _isLoading;
  String? get error => _error;

  void toggleInvoiceSelection(String invoiceId) {
    if (_selectedInvoices.contains(invoiceId)) {
      _selectedInvoices.remove(invoiceId);
    } else {
      _selectedInvoices.add(invoiceId);
    }
    notifyListeners();
  }

  bool isInvoiceSelected(String invoiceId) {
    return _selectedInvoices.contains(invoiceId);
  }

  Future<void> fetchInvoices(BuildContext context) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final url = Uri.parse(
          '${BaseUrl.baseMethodApi}/cms_cloud.cloud_membership_finance.api.get_member_invoices');
      final response = await http.get(
        url,
        headers: ApiKeys.getAuthHeaders(context),
      );
      debugPrint(response.body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['message']['status'] == 'success') {
          _invoices = data['message']['data'] ?? [];
          _selectedInvoices
              .clear(); // Clear selections when fetching new invoices
        } else {
          _error = 'Failed to fetch invoices: ${data['message']['status']}';
        }
      } else {
        _error = 'Failed to fetch invoices. Please try again later.';
      }
    } catch (error) {
      _error = 'An error occurred while fetching invoices.';
      debugPrint(error.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<PaymentResult?> paySelectedInvoices(BuildContext context,
      {String paymentType = 'Card', String provider = 'Taly'}) async {
    if (_selectedInvoices.isEmpty) {
      return null;
    }

    try {
      final url = Uri.parse(
          '${BaseUrl.baseMethodApi}/cms_cloud.cms_cloud.online_payment.pay_invoices');

      final response = await http.post(
        url,
        headers: ApiKeys.getAuthHeaders(context),
        body: json.encode({
          'selected_invoices': _selectedInvoices.toList(),
        }),
      );

      final data = json.decode(response.body);
      if (response.statusCode == 200 &&
          data['message']['status'] == 'success') {
        return PaymentResult(
          data['message']['orderId'],
          data['message']['formUrl'],
        );
      }
      return null;
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }

  Future<PaymentVerificationResult?> verifyPayment(
      BuildContext context, String orderId) async {
    try {
      final url = Uri.parse(
          '${BaseUrl.baseMethodApi}/cms_cloud.cms_cloud.online_payment.verify_payment_status');

      final response = await http.post(
        url,
        headers: ApiKeys.getAuthHeaders(context),
        body: json.encode({
          'orderId': orderId,
        }),
      );

      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        final message = data['message'];
        return PaymentVerificationResult(
          isPaid: message['paid'] == 1,
          errorMessage: message['error_message'] ?? '',
          amount: (message['amount'] as num).toDouble() /
              100, // Convert from cents to currency
          orderNumber: message['orderNumber']?.toString() ?? '',
        );
      }
      return null;
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }

  void clearInvoices() {
    _invoices = [];
    _selectedInvoices.clear();
    _error = null;
    notifyListeners();
  }
}
