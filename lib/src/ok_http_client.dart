import 'package:dio/dio.dart';
import 'package:flutter_ok_http_client/flutter_ok_http_client.dart';
import 'package:flutter_ok_http_client/src/request_executor.dart';

class OkHttpClient {
  final Dio _dio;

  OkHttpClient._(this._dio);

  static OkHttpClient builder() => OkHttpClient._(Dio());

  OkHttpClient addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
    return this;
  }

  OkHttpClient addAllInterceptors(Interceptors interceptors) {
    _dio.interceptors.addAll(interceptors);
    return this;
  }

  OkHttpClient clearInterceptors() {
    _dio.interceptors.clear();
    return this;
  }

  RequestExecutor newCall(Request request) {
    return RequestExecutor(dio: _dio, request: request);
  }
}
