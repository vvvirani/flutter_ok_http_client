import 'package:dio/dio.dart';
import 'package:flutter_ok_http_client/flutter_ok_http_client.dart';
import 'package:flutter_ok_http_client/src/request_executor.dart';

class OkHttpClient {
  OkHttpClient._();

  static final Dio _dio = Dio();

  static OkHttpClient builder() => OkHttpClient._();

  OkHttpClient setOptions(BaseOptions options) {
    _dio.options = options;
    return this;
  }

  OkHttpClient addInterceptor(Interceptor? interceptor) {
    if (interceptor != null) {
      _dio.interceptors.add(interceptor);
    } else {
      _dio.interceptors.clear();
    }
    return this;
  }

  OkHttpClient addAllInterceptors(Interceptors interceptors) {
    if (interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    } else {
      _dio.interceptors.clear();
    }
    return this;
  }

  RequestExecutor newCall(Request request) {
    return RequestExecutor(dio: _dio, request: request);
  }
}
