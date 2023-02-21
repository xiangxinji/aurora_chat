import 'package:dio/dio.dart';

String baseURL = 'http://192.168.71.6:3000';

final options = BaseOptions(
    baseUrl: baseURL,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15));

var dio = Dio(options);

class Http {
  static Future<T> get<T>(String url,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    var response =
        await dio.get<T>(url, data: data, queryParameters: queryParameters);
    return response.data as T;
  }

  static Future<Map<String, dynamic>> post(String url, Map<String, String> map,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    var response =
        await dio.post(url, data: data, queryParameters: queryParameters);
    return response.data;
  }
}
