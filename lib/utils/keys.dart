class ApiKeys {
  static const String baseUrl = 'https://v15.trackintltrade.com';
  static const String eventsEndpoint = '$baseUrl/api/resource/Member Events';
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'token 6752561e9b638a6:6490c27487543cd'
  };

  static const Map<String, String> imageHeaders = {
    'Authorization': 'token 6752561e9b638a6:6490c27487543cd'
  };
}
