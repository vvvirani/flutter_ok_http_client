import 'package:dio/dio.dart';
import 'package:flutter_ok_http_client/flutter_ok_http_client.dart';
import 'package:flutter_ok_http_client/src/request_type.dart';

class RequestExecutor {
  final Dio dio;
  final Request request;

  RequestExecutor({required this.dio, required this.request});

  Future<Response<dynamic>?> execute() async {
    try {
      Response<dynamic>? response;

      if (request.headers != null) {
        dio.options.headers = request.headers;
      }

      switch (request.type) {
        case RequestType.post:
          response = await dio.post(request.path, data: request.data);
          break;

        case RequestType.get:
          response = await dio.get(request.path);
          break;

        case RequestType.patch:
          response = await dio.patch(request.path, data: request.data);
          break;

        case RequestType.delete:
          response = await dio.delete(request.path, data: request.data);
          break;

        default:
      }
      return response;
    } on DioError catch (e) {
      if (e.response != null) return e.response;
      throw OkHttpClientException(e.error);
    } catch (e) {
      throw OkHttpClientException(e.toString());
    }
  }
}
