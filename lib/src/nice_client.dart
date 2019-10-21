import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

class NiceClient extends BaseClient {
  NiceClient({
    Client client,
    @required this.baseUrl,
    this.headers = const {},
  }) : this._inner = client ?? Client();

  final Client _inner;
  final String baseUrl;
  final Map<String, String> headers;

  @override
  Future<Response> head(url, {Map<String, String> headers}) {
    return super.head('$baseUrl$url', headers: headers);
  }

  @override
  Future<Response> get(url, {Map<String, String> headers}) {
    return super.get('$baseUrl$url', headers: headers);
  }

  @override
  Future<Response> post(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return super
        .post('$baseUrl$url', headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<Response> put(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return super
        .put('$baseUrl$url', headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<Response> patch(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return super.patch('$baseUrl$url',
        headers: headers, body: body, encoding: encoding);
  }

  Future<Response> delete(url, {Map<String, String> headers}) {
    return super.delete('$baseUrl$url', headers: headers);
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers.addAll(headers);
    return _inner.send(request);
  }
}
