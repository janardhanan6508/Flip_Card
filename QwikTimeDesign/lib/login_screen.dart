import 'package:QwikTimeDesign/leftWidget.dart';
// import 'package:QwikTimeDesign/rightWidget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomPadding: false,
      body: Container(
        // decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.cyan[200],Colors.white])),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  flex: 8,
                  child: LeftWidget()),
              // Expanded(flex: 1, child: RightWidget()),
            ]),
      ),
    );
  }
}
