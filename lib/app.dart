import 'package:flutter/material.dart';
import 'package:wordpress_api/pages/login_page.dart';
import 'package:wordpress_api/supplemental/cut_corners_border.dart';

import 'configs/colors.dart';


class WordPressApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _kWordPressTheme,
      home: LoginPage(),
    );
  }
}

final ThemeData _kWordPressTheme = _buildkWordPressTheme();

ThemeData _buildkWordPressTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    accentColor: Palette.kWordPressWhite,
    primaryColor: Palette.kWordPressBlue100,
    scaffoldBackgroundColor: Palette.kWordPressBlue900,
    buttonTheme: base.buttonTheme.copyWith(
        buttonColor: Palette.kWordPressBlue100,
        textTheme: ButtonTextTheme.normal
    ),
    textSelectionColor: Palette.kWordPressBlue100,
    errorColor: Palette.kWordPressErrorRed,
    //Wiz Chat Text Theme
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(
        color: Palette.kWordPressBlue900
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),),
  );


}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
      fontSize: 18.0,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: Palette.kWordPressBlue900,
    bodyColor: Palette.kWordPressWhite,
  );
}
