import 'package:dio/dio.dart';
import 'package:flutter_ok_http_client/flutter_ok_http_client.dart';
import 'package:flutter_ok_http_client/src/request_executor.dart';

abstract class OkHttpClient {
  static OkHttpClient builder() => _OkHttpClientBuilder._();

  OkHttpClient setOptions(BaseOptions options);

  OkHttpClient addInterceptor(Interceptor? interceptor);

  OkHttpClient addAllInterceptors(Interceptors interceptors);

  RequestExecutor newCall(Request request);
}

class _OkHttpClientBuilder extends _DioClient implements OkHttpClient {
  _OkHttpClientBuilder._();

  @override
  OkHttpClient setOptions(BaseOptions options) {
    _dio.options = options;
    return this;
  }

  @override
  OkHttpClient addInterceptor(Interceptor? interceptor) {
    if (interceptor != null) {
      _dio.interceptors.add(interceptor);
    } else {
      _dio.interceptors.clear();
    }
    return this;
  }

  @override
  OkHttpClient addAllInterceptors(Interceptors interceptors) {
    if (interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    } else {
      _dio.interceptors.clear();
    }
    return this;
  }

  @override
  RequestExecutor newCall(Request request) {
    return RequestExecutor(dio: _dio, request: request);
  }
}

class _DioClient {
  final Dio _dio = Dio();
}
