import 'package:flutter/material.dart';
import 'package:wordpress_api/pages/register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/wordpress.png'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                      prefixIcon: Icon(Icons.perm_identity)
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  ButtonBar(
                    buttonPadding: EdgeInsets.symmetric(horizontal: 12),
                    children: <Widget>[
                      FlatButton(
                        onPressed: _register,
                        child: Text('Register'),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        ),
                      ),
                      RaisedButton(
                        onPressed: _logIn,
                        child: Text('Sign in'),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _logIn() {}

  _register() => Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => RegistrationPage()),
      (dynamic route) => false);
}
