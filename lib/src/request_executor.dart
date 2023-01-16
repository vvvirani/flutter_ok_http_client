import 'package:dio/dio.dart';
import 'package:flutter_ok_http_client/flutter_ok_http_client.dart';
import 'package:flutter_ok_http_client/src/connectivity_utils.dart';

abstract class Executor {
  final Dio dio;
  final Request request;

  Executor({required this.dio, required this.request});
}

class RequestExecutor extends Executor {
  RequestExecutor({required Dio dio, required Request request})
      : super(dio: dio, request: request);

  Future<Response<dynamic>> execute() async {
    try {
      if (await ConnectivityUtils.isConnected) {
        return dio.request(
          request.path,
          data: request.data,
          options: Options(
            method: request.method?.name,
            headers: request.headers,
          ),
        );
      } else {
        throw NoConnectivityException();
      }
    } on DioError catch (e) {
      Response<dynamic>? response = e.response;
      if (response != null) return response;
      throw OkHttpClientException(e.error);
    } catch (e) {
      throw OkHttpClientException(e.toString());
    }
  }
}
