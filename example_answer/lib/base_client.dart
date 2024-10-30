import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

const String baseUrl = 'https://thronesapi.com/api/v2/';

class BaseClient {
  var client = http.Client();
  final dio = Dio();

  Future<dynamic> get(String api, {Map<String, String> query = const {}}) async {
    Response<dynamic> response;

    try {
      response = await dio.get(
        "$baseUrl$api",
        queryParameters: query,
        options: Options(
          headers: {
            'Authorization': '',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      log("e.error ${e.error}");
      // Handle errors
      if (e.response != null) {
        print('Error response data: ${e.response?.data}');
        print('Error response headers: ${e.response?.headers}');
        print('Error response status code: ${e.response?.statusCode}');
      } else {
        // Error occurred before response
        print('Error: ${e.message}');
      }
      throw Exception();
    }

    return null;
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var headers = {
      'Authorization': '',
      'Content-Type': 'application/json',
    };

    var response = await client.post(url, body: payload, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      // logger
      throw Exception(response.body);
    }
  }

  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var headers = {
      'Authorization': '',
      'Content-Type': 'application/json',
    };

    var response = await client.put(url, body: payload, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // logger
      throw Exception(response.body);
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': '',
    };

    var response = await client.delete(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // logger
      throw Exception(response.body);
    }
  }
}

class CustomError implements Exception {
  final String message;

  CustomError(this.message);
}
