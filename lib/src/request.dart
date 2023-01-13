import 'package:flutter_ok_http_client/src/request_type.dart';

class Request {
  final RequestType? type;
  final String path;
  final Map<String, String>? headers;
  final dynamic data;

  Request._({
    required this.path,
    this.type,
    this.headers,
    this.data,
  });

  Request._empty()
      : path = '',
        type = null,
        headers = null,
        data = null;

  Request _copyWith({
    RequestType? type,
    String? path,
    Map<String, String>? headers,
    dynamic data,
  }) {
    return Request._(
      path: path ?? this.path,
      type: type ?? this.type,
      headers: headers ?? this.headers,
      data: data ?? this.data,
    );
  }

  static RequestBuilder builder() => RequestBuilder();
}

class RequestBuilder {
  Request _request = Request._empty();

  RequestBuilder post({dynamic data}) {
    _request = _request._copyWith(type: RequestType.post, data: data);
    return this;
  }

  RequestBuilder get() {
    _request = _request._copyWith(type: RequestType.get);
    return this;
  }

  RequestBuilder delete({dynamic data}) {
    _request = _request._copyWith(type: RequestType.delete, data: data);
    return this;
  }

  RequestBuilder patch({dynamic data}) {
    _request = _request._copyWith(type: RequestType.patch, data: data);
    return this;
  }

  RequestBuilder setPath(String url) {
    _request = _request._copyWith(path: url);
    return this;
  }

  RequestBuilder setHeaders(Map<String, String> headers) {
    _request = _request._copyWith(headers: headers);
    return this;
  }

  Request build() {
    assert(_request.type != null && _request.path != '');
    return _request;
  }
}
