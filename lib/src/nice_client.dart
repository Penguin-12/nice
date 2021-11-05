import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';


class NiceClient  {
  NiceClient({
    Client client,
    @required this.baseUrl,
    this.headers = const {},
  }) : this._inner = client ?? Client();

  final Client _inner;
  final String baseUrl;
  final Map<String, String> headers;


  Future<Response> head(String url, {Map<String, String> headers}) {
    return _inner.head(Uri.parse('$baseUrl$url'), headers: headers);
  }

  Future<Response> get(String url, {Map<String, String> headers}) {
    return _inner.get(Uri.parse('$baseUrl$url'), headers: headers);
  }

  Future<Response> post(String url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return _inner.post(Uri.parse('$baseUrl$url'), headers: headers, body: body, encoding: encoding);
  }

  Future<Response> put(String url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return _inner.put(Uri.parse('$baseUrl$url'), headers: headers, body: body, encoding: encoding);
  }

  Future<Response> patch(String url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return _inner.patch(Uri.parse('$baseUrl$url'),
        headers: headers, body: body, encoding: encoding);
  }

  Future<Response> delete(String url, {Map<String, String> headers}) {
    return _inner.delete(Uri.parse('$baseUrl$url'), headers: headers);
  }

  Future<StreamedResponse> send(BaseRequest request) {
    request.headers.addAll(headers);
    return _inner.send(request);
  }
}