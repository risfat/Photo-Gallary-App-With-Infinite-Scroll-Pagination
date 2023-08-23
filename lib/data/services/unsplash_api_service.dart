import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../network/endpoints.dart';
import '../../network/network_utils.dart';

class UnsplashApiService {

  Future<List<dynamic>> fetchPhotos(int page, int perPage) async {
    dynamic responseBody;

    try {
      responseBody = await Network.handleResponse(await Network.getRequest(
          API.getImages(page, perPage), requireToken: true));

      if (responseBody != null) {

        return responseBody;
      } else {
        throw Exception('Failed to fetch photos');
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);

      print("================================");
      print(responseBody);
      print("================================");

      throw Exception('Failed to fetch photos');

    }
    // final response = await http.get(
    //   Uri.parse('$_baseUrl/photos?page=$page&per_page=$perPage'),
    //   headers: {'Authorization': 'Client-ID $_apiKey'},
    // );
    //
    // if (response.statusCode == 200) {
    //   return json.decode(response.body);
    // } else {
    //   throw Exception('Failed to fetch photos');
    // }
  }
}
