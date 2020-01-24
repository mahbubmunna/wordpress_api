

import 'package:flutter/material.dart';

class LoginRegUtil {

  //
  static logo() {
    return Container(
      height: 100,
      width: 100,
      child: Image.asset('assets/wordpress.png'),
    );
  }

  //
  static userNameField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: 'Username', prefixIcon: Icon(Icons.perm_identity)),
    );
  }

  //
  static passwordField(TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration:
      InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock)),
    );
  }

  //
  static emailField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Icons.email)
      ),
    );
  }

}