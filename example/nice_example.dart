import 'dart:convert';

import 'package:nice/nice.dart';

main() async {
  // This example uses the internet chuck norris database.
  final client = NiceClient(baseUrl: 'https://api.icndb.com');
  final res = await client.get('/jokes/random');

  if (res.statusCode != 200) {
    print('${res.statusCode}: Failure');
    return;
  }

  try {
    print(json.decode(res.body)['value']['joke']);
  } catch (e) {
    print('Response did not have a joke');
  }
}
