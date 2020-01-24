

class User {
  final String email;
  final String first;
  final String last;
  final String error;


  User(this.email, this.first, this.last, this.error);

  User.fromJson(Map<String, dynamic> json)
      : email = json["email"],
        first = json["first"],
        last = json["last"],
        error = "";

  User.withError(String errorValue)
      : email = "",
        first = "",
        last ="",
        error= errorValue;


}
