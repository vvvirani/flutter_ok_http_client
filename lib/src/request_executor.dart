import 'package:dio/dio.dart';
import 'package:flutter_ok_http_client/flutter_ok_http_client.dart';

class RequestExecutor {
  final Dio dio;
  final Request request;

  RequestExecutor({required this.dio, required this.request});

  Future<Response<dynamic>?> execute() async {
    try {
      Response<dynamic>? response;

      Uri uri = _nullOrValue<Uri>(request.uri);

      switch (request.type) {
        case RequestType.post:
          response = await dio.postUri(uri, data: request.body);
          break;

        case RequestType.get:
          response = await dio.getUri(uri);
          break;

        case RequestType.patch:
          response = await dio.patchUri(uri, data: request.body);
          break;

        case RequestType.delete:
          response = await dio.deleteUri(uri, data: request.body);
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

T _nullOrValue<T>(dynamic value) => value;
