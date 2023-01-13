import 'package:dio/dio.dart';
import 'package:flutter_ok_http_client/flutter_ok_http_client.dart';

class RequestExecutor {
  final Dio dio;
  final Request request;

  RequestExecutor({required this.dio, required this.request});

  Future<Response<dynamic>> execute() async {
    try {
      return dio.request(
        request.path,
        data: request.data,
        options: Options(
          method: request.method?.name,
          headers: request.headers,
        ),
      );
    } on DioError catch (e) {
      Response<dynamic>? response = e.response;
      if (response != null) return response;
      throw OkHttpClientException(e.error);
    } catch (e) {
      throw OkHttpClientException(e.toString());
    }
  }
}
