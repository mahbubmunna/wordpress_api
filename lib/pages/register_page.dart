
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wordpress_api/pages/login_page.dart';
import 'package:wordpress_api/providers/shared_pref_provider.dart';
import 'package:wordpress_api/repository/registration_repository.dart';
import 'package:wordpress_api/repository/token_repository.dart';
import 'package:wordpress_api/utils/common_utils.dart';
import 'package:wordpress_api/utils/loginreg_utils.dart';

import 'home_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _usernameController = TextEditingController();
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
                    _isLoading ? CommonUtils.showProgressBar() :
                        Column(
                          children: <Widget>[
                            SizedBox(height: 16),
                            LoginRegUtil.userNameField(_usernameController),
                            SizedBox(height: 8),
                            LoginRegUtil.emailField(_emailController),
                            SizedBox(height: 8),
                            LoginRegUtil.passwordField(_passwordController),
                            SizedBox(height: 8),
                            _registerButton(),
                            SizedBox(height: 4),
                            _back2LoginButton(),
                          ],
                        )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  //
  _registerButton() {
    return ButtonTheme(
      height: 50,
      minWidth: double.infinity,
      child: RaisedButton(
        onPressed: () {
          _register();
        },
        child: Text('Register'),
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7))),
      ),
    );
  }

  //
  _back2LoginButton() {
    return ButtonTheme(
        height: 50,
        minWidth: double.infinity,
        child: FlatButton(
          onPressed: () {
            CommonUtils.changeScreen(context, LoginPage());
          },
          child: Text('Already have account? Back to login'),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
        ));
  }

  _register() async {
    setState(() {
      _isLoading = true;
      _postRegistrationData();
    });
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

  _postRegistrationData() async{
    Map registrationInfo = {
      'username': _usernameController.text,
      'email': _emailController.text,
      'password': _passwordController.text
    };

    print(registrationInfo);
    var registrationResponse =
        await RegistrationRepository.postRegistrationInfo(registrationInfo);

    if (registrationResponse.hashCode == 201) {
      setState(() {
        _isLoading = false;
        _getAndSaveToken();
      });
    } else {
      setState(() {
        _isLoading = false;
        CommonUtils.showErrorDialog(context, 'Failed', 'Try again', 'close');
      });
    }
  }
}
