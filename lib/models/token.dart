

class Token {
  final String refresh;
  final String access;
  final String error;

  Token(this.refresh, this.access, this.error);

  Token.fromJson(Map<String, dynamic> json)
      : refresh = json['refresh'],
        access = json['access'],
        error = "";

  Token.withError(String errorValue)
      : refresh = "",
        access = "",
        error = errorValue;
}