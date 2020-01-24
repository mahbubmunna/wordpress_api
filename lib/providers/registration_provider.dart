

import 'package:dio/dio.dart';

class RegistrationProvider {
  static final _endpoint = "http://192.168.1.109:8000/userApi/registration/";
  static final _dio = Dio();

  static Future<dynamic> postRegistrationInfo(Map registrationInfo) async{
    _dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await _dio.post(_endpoint, data: registrationInfo);
      return response;
    } catch (error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }

  }
}