
class ApiHeaders {
  static Future<Map<String, dynamic>> getHeaders() async {
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      // 'accept': "application/json",
      // "token": "token"
    };

    return headers;
  }
}
