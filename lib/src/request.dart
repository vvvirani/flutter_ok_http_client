import 'package:flutter_ok_http_client/src/request_type.dart';

class Request {
  final RequestType? type;
  final Uri? uri;
  final Map<String, String>? headers;
  final Map<String, dynamic>? body;

  Request._({
    this.type,
    this.uri,
    this.headers,
    this.body,
  });

  Request._empty()
      : type = null,
        uri = null,
        headers = null,
        body = null;

  Request _copyWith({
    RequestType? type,
    Uri? uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    return Request._(
      type: type ?? this.type,
      uri: uri ?? this.uri,
      headers: headers ?? this.headers,
      body: body ?? this.body,
    );
  }

  static RequestBuilder builder() => RequestBuilder();
}

class RequestBuilder {
  Request _request = Request._empty();

  RequestBuilder setRequestType(RequestType type) {
    _request = _request._copyWith(type: type);
    return this;
  }

  RequestBuilder setUrl(String url) {
    _request = _request._copyWith(uri: Uri.parse(url));
    return this;
  }

  RequestBuilder setHeaders(Map<String, String> headers) {
    _request = _request._copyWith(headers: headers);
    return this;
  }

  RequestBuilder setBody(Map<String, dynamic> body) {
    _request = _request._copyWith(body: body);
    return this;
  }

  Request build() {
    assert(_request.type != null && _request.uri != null);
    assert(_request.type == RequestType.get && _request.body == null);
    return _request;
  }
}
