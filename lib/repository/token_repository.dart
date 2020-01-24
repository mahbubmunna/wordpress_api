

import 'package:wordpress_api/models/token.dart';
import 'package:wordpress_api/providers/token_provider.dart';


class TokenRepository {

  static Future<Token> getToken(Map loginInfo) {
    return TokenProvider.getToken(loginInfo);
  }
}