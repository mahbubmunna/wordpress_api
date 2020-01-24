

import 'package:dio/dio.dart';
import 'package:wordpress_api/models/token.dart';

class TokenProvider{
  static final _endPoint = "http://192.168.1.109:8000/userApi/token/";
  static final _dio = Dio();

  static Future<Token> getToken(Map loginInfo) async {
    _dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response = await _dio.post(_endPoint, data: loginInfo);
      return Token.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return Token.withError("$error");
    }
  }

}