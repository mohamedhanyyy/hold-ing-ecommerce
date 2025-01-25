import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/const/api_consts.dart';

class NetworkClient {
  final _opts = BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveDataWhenStatusError: true,
    followRedirects: false,
    validateStatus: (status) {
      return status! <= 505;
    },
  );

  Future<Response?> postData(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      final response = await Dio(_opts).post(url, data: data);

      debugPrint('Full url: ${response.requestOptions.baseUrl}$url');
      debugPrint('Status code: ${response.statusCode}');
      debugPrint('Response data: ${response.data}');
      debugPrint('Request options: ${response.requestOptions.data}');

      return response;
    } catch (e) {
      debugPrint('$e');

      return e is DioException ? e.response : null;
    }
  }

  Future<Response?> putData(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      final response = await Dio(_opts).put(url, data: data);

      debugPrint('Full url: ${response.requestOptions.baseUrl}$url');
      debugPrint('Status code: ${response.statusCode}');
      debugPrint('Response data: ${response.data}');
      debugPrint('Request options: ${response.requestOptions.data}');

      return response;
    } catch (e) {
      debugPrint('$e');

      return e is DioException ? e.response : null;
    }
  }

  Future<Response?> getData(
      {required String url,
      Map<String, dynamic>? data,
      Map<String, dynamic>? query}) async {
    try {
      final response =
          await Dio(_opts).get(url, data: data, queryParameters: query);
      debugPrint('Full url: ${response.requestOptions.baseUrl}$url');
      debugPrint('Status code: ${response.statusCode}');
      debugPrint('Response data: ${response.data}');
      debugPrint('Request options: ${response.requestOptions.data}');

      return response;
    } catch (e) {
      debugPrint('$e');

      return e is DioException ? e.response : null;
    }
  }
}
