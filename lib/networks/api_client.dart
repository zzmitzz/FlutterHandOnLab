import 'dart:convert';

import 'package:http/http.dart' as http;

enum HttpMethod { get, post }

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late final http.Client _client;

  // Private constructor
  ApiClient._internal() : _client = http.Client();

  final String _baseUrl = 'http://api.weatherapi.com/v1/';

  // Factory constructor to return the singleton instance
  factory ApiClient() => _instance;

  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  final Map<String, String> _defaultQueryParams = {
    "key": "dba1b9b26de848be88165712252702",
  };

  void setAdditionalHeader(String key, String value) {
    _defaultHeaders[key] = value;
  }

  Future<Map<String, dynamic>> _request({
    required HttpMethod method,
    required String endpoint,
    Map<String, String>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    try {
      queryParams?.addAll(_defaultQueryParams);
      final uri = Uri.parse('$_baseUrl/$endpoint').replace(
        queryParameters: queryParams?.map(
          (key, value) => MapEntry(key, value.toString()),
        ),
      );
      http.Response response;
      switch (method) {
        case HttpMethod.get:
          response = await _client.get(uri, headers: _defaultHeaders);
          break;
        case HttpMethod.post:
          response = await _client.post(uri, headers: _defaultHeaders);
          break;
      }
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('API Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Request failed: $e');
    }
  }

  Future<Map<String, dynamic>> doGet({
    required String endpoint,
    Map<String, String>? queryParams,
  }) async {
    return _request(method: HttpMethod.get, endpoint: endpoint, queryParams: queryParams);
  }

  Future<Map<String, dynamic>> doPost({
    required String endpoint,
    Map<String, String>? queryParams,
  }) async {
    return _request(method: HttpMethod.post, endpoint: endpoint, queryParams: queryParams);
  }
  void dispose() {
    _client.close();
  }
}
