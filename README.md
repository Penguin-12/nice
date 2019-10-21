A thin wrapper over the http package. It includes quality of life improvements like:
* the ability to specify a base url
* the ability to specify headers which are to be added to all requests

That's it. This thing exists solely because I hated specifying the base url everytime I had to make a request when using the http package.

## Usage

Since it is a really thin wrapper over http, the only thing new is the creation of the `NiceClient` object. Rest of the usage is the exact same. A simple usage example:

```dart
import 'package:nice/nice.dart';

main() async {
  var client = new NiceClient(
    baseUrl: 'https://some.thing.org',
    headers: {'Content-Type': 'application/json'}
  );

  final response = await client.get('/your/url');
}
```
