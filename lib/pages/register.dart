import 'package:flutter/material.dart';
import 'package:wordpress_api/pages/login.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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

                    ),
                    SizedBox(height: 4),
                    TextField(),
                    SizedBox(height: 4),
                    TextField(),
                    SizedBox(height: 4),
                    RaisedButton(
                      onPressed: _register,
                      child: Text('Register'),
                    ),
                    FlatButton(
                      onPressed: _back2SignIn,
                      child: Text('Back to Log in'),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void _back2SignIn() => Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginPage()),
          (dynamic route) => false);

  void _register() {}
}
