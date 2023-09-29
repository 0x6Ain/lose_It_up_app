import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:lose_it_up_app/utils/http_service/http_response.dart';

enum HttpMethod { get, post, patch, delete }

@lazySingleton
class HttpService {
  HttpService(this._dio);

  final Dio _dio;
  final Duration _timeout = const Duration(milliseconds: 29000);
  final String _baseUrl = dotenv.get('API_URL', fallback: 'http://localhost:3000');

  Future<HttpResponse> sendRequest<RequestDataType>({
    required HttpMethod httpMethod,
    String? path,
    RequestDataType? data,
  }) async {
    final endPoint = path != null ? '$_baseUrl/$path' : '$_baseUrl';
    final RequestOptions requestOptions = RequestOptions(
      path: endPoint,
      method: httpMethod.name.toUpperCase(),
      // headers: headers,
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
      // queryParameters: queryParameter?.toJson(),
    );

    Response? response;
    try {
      response = await _dio.fetch(requestOptions);
      if (kDebugMode) print('response : $response');
    } on DioException catch (error) {
      if (kDebugMode) print('response?.statusCode : ${response?.statusCode}');
      if (kDebugMode) print('response?.statusMessage : ${response?.statusMessage}');
      if (kDebugMode) print(error);
      //todo: log event
    }
    if (response?.data != null) {
      HttpResponse apiResponse = HttpResponse.fromJson(response!.data);
      return apiResponse;
    }

    return HttpResponse();
  }
}
