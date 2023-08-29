import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lose_it_up_app/utils/http_service/http_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'http_service.g.dart';

enum Resource { auth, meal }

enum HttpMethod { get, post, patch, delete }

@riverpod
class HttpService extends _$HttpService {
  final Duration timeout = const Duration(milliseconds: 29000);
  String get baseUrl {
    String url = dotenv.get('API_URL');
    if (url.isEmpty) {
      Platform.isAndroid ? url = 'http://10.0.2.2:3000' : url = 'http://127.0.0.1:3000';
    }
    return url;
  }

  late final Dio _dio;
  @override
  Dio build() {
    _dio = Dio();
    return _dio;
  }

  Future<HttpResponse> sendRequest({
    required ResponseType responseType,
    required HttpMethod httpMethod,
    Resource? resource,
    String? url,
    Map<String, dynamic>? queryParameters,
  }) async {
    final endPoint = '${url ?? baseUrl}/$resource';
    try {
      final response = await _dio.request(endPoint,
          queryParameters: queryParameters,
          options: Options(
            method: httpMethod.name.toUpperCase(),
            sendTimeout: timeout,
            receiveTimeout: timeout,
            responseType: responseType,
          ));
      return HttpResponse.fromJson(response.data);
    } on DioException catch (e) {
      print(e);
    }
    return HttpResponse();
  }
}
