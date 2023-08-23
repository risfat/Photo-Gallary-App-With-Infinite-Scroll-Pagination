import 'dart:convert';
import 'dart:io';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart';
import '../utils/color_constant.dart';
import 'endpoints.dart';

class Network {
  static String noInternetMessage = "Check your connection!";
  static const String _accessToken = "j-PoAIk-q8sZQtkEk1pxBprz9ZmvPzM8VSxQoWHI5pg";

  static getRequest(String endPoint,
      {bool requireToken = true, bool noBaseUrl = false}) async {
    if (await isNetworkAvailable()) {
      Response response;

      var headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      if (requireToken) {
        var header = {'Authorization': 'Client-ID $_accessToken'};
        headers.addAll(header);
      }

      print('\nURL: ${API.BASE_URL}$endPoint');
      print("Headers: $headers\n");
      if (requireToken) {
        response =
            await get(Uri.parse('${API.BASE_URL}$endPoint'), headers: headers);
      } else if (noBaseUrl) {
        response = await get(Uri.parse(endPoint));
      } else {
        response = await get(Uri.parse('${API.BASE_URL}$endPoint'));
      }

      return response;
    } else {
      throw noInternetMessage;
    }
  }

  static postRequest(String endPoint, body, {bool requireToken = true}) async {
    if (await isNetworkAvailable()) {

      var headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      if (requireToken) {
        var header = {'Authorization': 'Client-ID $_accessToken'};
        headers.addAll(header);
      }

      print('\nURL: ${API.BASE_URL}$endPoint');
      print("Headers: $headers");
      print('Request Body: ${jsonEncode(body)}\n');

      Response response = await post(Uri.parse(API.BASE_URL + endPoint),
          body: jsonEncode(body), headers: headers);
      //   print('Response: $response');
      return response;
    } else {
      throw noInternetMessage;
    }
  }

  static handleResponse(Response response) async {
    if (!await isNetworkAvailable()) {
      toast('No network available');
    } else if (response.statusCode >= 200 && response.statusCode <= 210) {
      print('\nSuccessCode: ${response.statusCode}');
      print('SuccessResponse: ${response.body}\n');
      if (response.body.isNotEmpty && response.body.isJson()) {
        return json.decode(response.body);
      } else {
        return response.body;
      }
    } else {
      print('\nErrorCode: ${response.statusCode}');
      print("ErrorResponse: ${response.body}\n");

      if (response.statusCode == 401) {
        /// Session expired
        // toast('Session expired! Login to continue...', bgColor: KColor.red);
        toast('${jsonDecode(response.body)['msg']}', bgColor: ColorConstant.red);

      } else if (response.statusCode == 422) {
        /// Custom validation message
        toast(
          '${jsonDecode(response.body)['errors'][0]['message']}',
          bgColor: ColorConstant.red,
        );
      } else if (response.statusCode == 404 || response.statusCode == 400) {
        /// Custom message

      }
      if (response.statusCode == 403) {
        toast(response.body, bgColor: ColorConstant.red);
        return response.body;
      } else {
        // toast('Something went wrong!', bgColor: ColorConstant.redA200);
      }
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
