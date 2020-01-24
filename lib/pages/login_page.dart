import 'package:flutter/material.dart';
import 'package:wordpress_api/pages/home_page.dart';
import 'package:wordpress_api/pages/register_page.dart';
import 'package:wordpress_api/providers/shared_pref_provider.dart';
import 'package:wordpress_api/repository/token_repository.dart';
import 'package:wordpress_api/utils/common_utils.dart';
import 'package:wordpress_api/utils/loginreg_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var _isLoading = false;

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
                  LoginRegUtil.logo(),
                  _isLoading
                      ? CommonUtils.showProgressBar()
                      : Column(
                          children: <Widget>[
                            SizedBox(height: 16),
                            LoginRegUtil.emailField(_emailController),
                            SizedBox(height: 8),
                            LoginRegUtil.passwordField(_passwordController),
                            SizedBox(height: 8),
                            _loginButton(),
                            SizedBox(height: 8),
                            _registerButton(),
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

  _logIn() {
    setState(() {
      _isLoading = true;
      _getAndSaveToken();
    });
  }

  _loginButton() {
    return ButtonTheme(
      height: 50,
      minWidth: double.infinity,
      child: RaisedButton(
        onPressed: _logIn,
        child: Text('Sign in'),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
        ),
      ),
    );
  }

  _registerButton() {
    return ButtonTheme(
        height: 50,
        minWidth: double.infinity,
        child: FlatButton(
          onPressed: (){
            CommonUtils.changeScreen(context, RegistrationPage());
          },
          child: Text('New? Please click to register'),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
        ));
  }

  _getAndSaveToken() async {
    var loginInfo = {
      'email': _emailController.text,
      'password': _passwordController.text
    };
    print(loginInfo);
    var token = await TokenRepository.getToken(loginInfo);

    if (!(token.error == "" || token.error == null)) {
      setState(() {
        _isLoading = false;
        CommonUtils.showErrorDialog(
            context, "Failure", "Failed to Login, try again", "close");
      });
    } else {
      print(token.access);
      setState(() {
        _isLoading = false;
        SharedPrefProvider.setString('access_token', token.access);
      });
      CommonUtils.changeScreen(context, HomePage());
    }
  }

}
