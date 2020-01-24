import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:wordpress_api/configs/colors.dart';
import 'package:wordpress_api/pages/home_page.dart';
import 'package:wordpress_api/providers/shared_pref_provider.dart';

import 'login_page.dart';


class SplashFirst extends StatefulWidget {
  @override
  _SplashFirstState createState() => _SplashFirstState();
}

class _SplashFirstState extends State<SplashFirst> {
  var isSignedIn = false;
  @override
  Widget build(BuildContext context) {
    var token = SharedPrefProvider.getString('access');
    if(token != null || token != "") isSignedIn = true;
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: isSignedIn ? HomePage() : LoginPage(),
        title: Text('Welcome to somewhere',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: Image.asset('assets/wordpress.png'),
        backgroundColor: Palette.kWordPressBlue900,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 50.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.white,
        loadingText: Text(
            'My work is loading...',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),

        ),
    );
  }
}
