import 'package:QwikTimeDesign/main.dart';
import 'package:flutter/material.dart';

class LeftWidget extends StatefulWidget {
  @override
  _LeftWidgetState createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      // backgroundColor: Colors.cyan[600],
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.cyan, Colors.cyan[200]])),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Qwik'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.cyan[800],
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Time'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.cyan[800],
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 40),
                    //   child: Align(
                    //     alignment: Alignment.center,
                    //     child: RichText(
                    //       text: TextSpan(
                    //         children: <TextSpan>[
                    //           TextSpan(
                    //               text: 'Qwik',
                    //               style: TextStyle(
                    //                   color: Colors.black,
                    //                   fontSize: 40,
                    //                   fontWeight: FontWeight.bold)),
                    //           TextSpan(
                    //               text: 'Time',
                    //               style: TextStyle(
                    //                 color: Colors.black,
                    //                 fontSize: 40,
                    //               )),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Text(
                      "Welcome back. Aadhi !",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                color: Colors.white
                                //  Color.fromRGBO(173, 179, 191, 0.7),
                                ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Center(
                                child: TextFormField(
                                  showCursor: false,
                                  // controller: widget.passwordcontroller,
                                  // focusNode: widget.passwordFocus,
                                  keyboardType: TextInputType.number,
                                  obscuringCharacter: ".",
                                  obscureText: true,
                                  style: TextStyle(fontSize: 30),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )),
                        Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                color: Colors.white
                                // Color.fromRGBO(173, 179, 191, 0.7),
                                ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child:  Center(
                                child: TextFormField(
                                  showCursor: false,
                                  // controller: widget.passwordcontroller,
                                  // focusNode: widget.passwordFocus,
                                  keyboardType: TextInputType.number,
                                  obscuringCharacter: ".",
                                  obscureText: true,
                                  style: TextStyle(fontSize: 30),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )),
                        Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                color: Colors.white
                                // color: Color.fromRGBO(173, 179, 191, 0.7),
                                ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child:  Center(
                                child: TextFormField(
                                  showCursor: false,
                                  // controller: widget.passwordcontroller,
                                  // focusNode: widget.passwordFocus,
                                  keyboardType: TextInputType.number,
                                  obscuringCharacter: ".",
                                  obscureText: true,
                                  style: TextStyle(fontSize: 30),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )),
                        Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                color: Colors.white
                                // color: Color.fromRGBO(173, 179, 191, 0.7),
                                ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Center(
                                child: TextFormField(
                                  showCursor: false,
                                  // controller: widget.passwordcontroller,
                                  // focusNode: widget.passwordFocus,
                                  keyboardType: TextInputType.number,
                                  obscuringCharacter: ".",
                                  obscureText: true,
                                  style: TextStyle(fontSize: 30),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Text(
                    //   "Sign up",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold),
                    // )
                    Container(
                      height: 40,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        },
                        color: Colors.cyan[800],
                        textColor: Colors.white,
                        child: Text("Sign in", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                        width: 500,
                        height: 200,
                        child: Image.asset(
                          'images/login.png',
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Simplest way to log your time...",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
