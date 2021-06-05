import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'message.dart';

class ApiService {
  static final Duration _timeoutDuration = Duration(seconds: 20);
  static Map<String, String> _userHeader = Map();


  static Map errorMap(int statusCode, String message) {
    Map<String, dynamic> map = Map();
    map['statusCode'] = statusCode;
    map['message'] = message;

    return map;
  }



  ApiService(String token) {
    _userHeader['accessToken'] = token;
  }

  static hit({
    required Uri url,
    dynamic body,
    bool encodeData = false,
  }) async {
    try {

      http.Response response;
      var jsonBody = body;

      if (encodeData) {
        jsonBody = json.encode(body);
      }

      switch (apiType.get) {
        case apiType.get:
          response = await http
              .get(url)
              .timeout(_timeoutDuration);
          break;
        case apiType.put:
          response = await http
              .put(url, headers: _userHeader, body: jsonBody)
              .timeout(_timeoutDuration);
          break;
        case apiType.post:
          response = await http
              .post(url,body: jsonBody)
              .timeout(_timeoutDuration);
          break;
      }
      print("Response Body:${response.body}");
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw new Exception('EXCEPTION');
      }
    } on TimeoutException {
      print(CONNECTION_TIMEOUT);
      return errorMap(ERROR_CONNECTION_TIMEOUT, CONNECTION_TIMEOUT);
    } on SocketException {
      print(SOCKET_EXCEPTION);
      return errorMap(ERROR_SOCKET_EXCEPTION, SOCKET_EXCEPTION);
    } catch (e) {
      print("Exceptioin ::$e");
      return errorMap(ERROR_EXCEPTION, ERROR);
    }
  }

}

enum apiType { get, post, put } //delete,option,head,connect ,trace
