
import 'package:dio/dio.dart';
import 'package:flutter_ok_http_client/flutter_ok_http_client.dart';
import 'package:flutter_ok_http_client/src/connectivity_utils.dart';

class RequestExecutor {
  late final Dio _dio;
  late final Request _request;

  RequestExecutor({required Dio dio, required Request request}) {
    _dio = dio;
    _request = request;
  }

  Future<Response<dynamic>> execute() async {
    try {
      if (await ConnectivityUtils.isConnected) {
        return await _dio.request(
          _request.path,
          data: _request.data,
          options: Options(
            method: _request.method?.name,
            headers: _request.headers,
          ),
        );
      } else {
        throw NoConnectivityException();
      }
    } on DioError catch (e) {
      Response<dynamic>? response = e.response;
      if (response != null) {
        return response;
      } else {
        throw OkHttpClientException(e.error);
      }
    } catch (e) {
      throw OkHttpClientException(e.toString());
    }
  }
}
