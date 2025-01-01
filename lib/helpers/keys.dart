class BaseUrl {
  static const String baseUrl = "https://v15.trackintltrade.com";
  static const String baseApi = "$baseUrl/api/resource";
  static const String baseMethodApi = "$baseUrl/api/method";
  
  // Auth endpoints
  static const String login = "$baseMethodApi/cms_cloud.cms_auth.auth_client.login";
  
  // Payment endpoints
  static const String processPayment = "$baseMethodApi/cms_cloud.cms_cloud.online_payment.process_payment";
  static const String checkPaymentStatus = "$baseMethodApi/cms_cloud.cms_cloud.online_payment.check_payment_status";
}

class ApiKeys {
  static const String authToken = "6752561e9b638a6:6490c27487543cd";
}
