import 'package:flutter/material.dart';
import 'package:wordpress_api/widgets/user_widget.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: UserWidget(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.7],
              colors: [
                Color(0xFFF12711),
                Color(0xFFf5af19),
              ],
            ),
          ),
        )
      ),
    );
  }
}
