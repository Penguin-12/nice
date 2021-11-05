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
  Future<Response> head(String url, {Map<String, String> headers}) {
    return super.head(Uri.parse('$baseUrl$url'), headers: headers);
  }

  @override
  Future<Response> get(String url, {Map<String, String> headers}) {
    return super.get(Uri.parse('$baseUrl$url'), headers: headers);
  }

  @override
  Future<Response> post(String url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return super
        .post(Uri.parse('$baseUrl$url'), headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<Response> put(String url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return super
        .put(Uri.parse('$baseUrl$url'), headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<Response> patch(String url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return super.patch(Uri.parse('$baseUrl$url'),
        headers: headers, body: body, encoding: encoding);
  }

  Future<Response> delete(String url, {Map<String, String> headers}) {
    return super.delete(Uri.parse('$baseUrl$url'), headers: headers);
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers.addAll(headers);
    return _inner.send(request);
  }
}
