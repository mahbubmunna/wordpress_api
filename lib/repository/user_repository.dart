
import 'package:wordpress_api/models/user.dart';
import 'package:wordpress_api/providers/user_provider.dart';

class UserRepository {

  static Future<User> getUser() {
    return UserProvider.getUser();
  }
}