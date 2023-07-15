// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'rest_exceptions.dart';

class RestHelper {
  final bool debug;
  final bool ssl;
  final String baseUrl;
  Map<String, String>? headers;

  RestHelper({
    required this.baseUrl,
    this.ssl = false,
    this.debug = false,
    this.headers,
  });

  Future<dynamic> get({
    required String url,
    String? jwtToken,
    String? accessToken,
  }) async {
    dynamic responseJson;
    try {
      var apiUrl = ssl ? Uri.https("$baseUrl$url") : Uri.http("$baseUrl$url");
      final response = await http.get(
        apiUrl,
        headers: addAuthorizationHeader(jwtToken, accessToken),
      );
      responseJson = _decodeResponse(response);
    } on SocketException catch (e, s) {
      throw NoNetworkException(
        message: 'No Internet connection > e',
        stackTrace: s,
      );
    } catch (e, s) {
      throw FetchDataException(
        message: 'Failed > $e',
        stackTrace: s,
      );
    }
    return responseJson;
  }

  Future<dynamic> post({
    required String url,
    required Object body,
    String? jwtToken,
    String? accessToken,
  }) async {
    http.Response responseJson;
    try {
      var apiUrl = ssl ? Uri.https("$baseUrl$url") : Uri.http("$baseUrl$url");
      final response = await http.post(
        apiUrl,
        body: body,
        headers: addAuthorizationHeader(jwtToken, accessToken),
      );
      responseJson = _decodeResponse(response);
    } on SocketException catch (e, s) {
      throw NoNetworkException(
        message: 'No Internet connection > $e',
        stackTrace: s,
      );
    } catch (e, s) {
      throw FetchDataException(
        message: 'Failed > $e',
        stackTrace: s,
      );
    }
    return responseJson;
  }

  Map<String, String>? addAuthorizationHeader(
    String? jwtToken,
    String? accessToken,
  ) {
    if (headers != null) {
      if (jwtToken != null) {
        headers!['Authorization: Bearer'] = jwtToken;
      }
      if (accessToken != null) {
        headers!['Authorization'] = accessToken;
      }
    } else {
      if (jwtToken != null) {
        headers = {'Authorization: Bearer', jwtToken} as Map<String, String>;
      }
      if (accessToken != null) {
        headers = {'Authorization', accessToken} as Map<String, String>;
      }
    }
    return headers;
  }

  dynamic _decodeResponse(http.Response response) {
    var responseBody = response.body.toString();
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(responseBody);
        if (debug) print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(
          message: responseBody,
          stackTrace: StackTrace.current,
          statusCode: response.statusCode,
        );
      case 401:
      case 403:
        throw UnauthorizedException(
          message: responseBody,
          stackTrace: StackTrace.current,
          statusCode: response.statusCode,
        );
      case 500:
      default:
        throw FetchDataException(
          prefix: 'Fetch Error (${response.statusCode}): ',
          message: responseBody,
          stackTrace: StackTrace.current,
          statusCode: response.statusCode,
        );
    }
  }
}
