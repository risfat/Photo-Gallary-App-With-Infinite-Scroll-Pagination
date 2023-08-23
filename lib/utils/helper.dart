import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<Uint8List> fetchImageBytes(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));

  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to fetch image');
  }
}


String capitalize(String name) {
  if (name.isEmpty) {
    return name;
  }
  return name[0].toUpperCase() + name.substring(1);
}
