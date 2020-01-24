
import 'package:dio/dio.dart';
import 'package:wordpress_api/models/user.dart';
import 'package:wordpress_api/providers/shared_pref_provider.dart';

class UserProvider{
  static final String _endpoint = "http://192.168.1.109:8000/userApi/user/";
  static final Dio _dio = Dio();

  static Future<User> getUser() async {
    _dio.options.headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer ${SharedPrefProvider.getString('access_token')}"
    };

    try {
      Response response = await _dio.get(_endpoint);
      return User.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return User.withError("$error");
    }
  }
}