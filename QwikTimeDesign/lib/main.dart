import 'dart:io';

import 'package:QwikTimeDesign/flipcard_alive_state.dart';
import 'package:QwikTimeDesign/login_screen.dart';
import 'package:QwikTimeDesign/timesheetEntryScreen.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  var _deviceData;
  List<GlobalKey<FlipCardState>> _cardStateKeys;
  GlobalKey<FlipCardState> lastFlipped;
  final List<String> leavelist = [
    "04-09",
    "10-16",
    "17-23",
    "24-30",
    "31-06",
  ];
  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  @override
  void initState() {
    super.initState();
    _cardStateKeys = getCardStateKeys();
  }

  // _onSelected(int index) {
  //   setState(() {
  //     return _previousIndex = index;
  //   });
  // }
 Future<void> initPlatformState() async {
    var deviceData;

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        deviceData=androidInfo.id;
      } else if (Platform.isIOS) {
        IosDeviceInfo IOSInfo =  await deviceInfoPlugin.iosInfo;
        deviceData = IOSInfo.identifierForVendor;
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "QWikTime".toUpperCase(),
            style: TextStyle(
                color: Colors.cyan[800],
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.cyan[800],
              size: 30,
            ),
            onPressed: () => _openEndDrawer(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Last 3 months",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),    
                      Container(
                          width: 20,
                          height: 20,
                          child: Image.asset('images/down-arrow.png')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Container(
                          height: 20,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            onPressed: () {
                              cardKey.currentState.toggleCard();
                            },
                            color: Colors.cyan[800],
                            textColor: Colors.white,
                            child: Text("All",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          height: 20,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            onPressed: () {
                              cardKey.currentState.toggleCard();
                            },
                            color: Colors.grey,
                            textColor: Colors.white,
                            child: Text("Rejected",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          height: 20,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            onPressed: () {
                              cardKey.currentState.toggleCard();
                            },
                            color: Colors.grey,
                            textColor: Colors.white,
                            child: Text("Due",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: leavelist.length,
                    itemBuilder: (context, index) {
                      return FlipCardWithKeepAlive(
                        child: FlipCard(
                          key: _cardStateKeys[index],
                          onFlip: () {
                           
                          },
                          front: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TimesheetEntryScreen()));
                              // return _onSelected(index);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 5),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(40),
                                    ),
                                  ),
                                  elevation: 5,
                                  color: Colors.cyan[100],
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                              child: Text(
                                                "APPROVED",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "40",
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 55.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "hrs",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        Container(
                                            width: 300,
                                            height: 210,
                                            child: Image.asset(
                                                'images/approve_image.png')),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: 'AUG ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text: leavelist[
                                                                  index],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          back: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(40),
                                    ),
                                  ),
                                  elevation: 5,
                                  color: Colors.orange[200],
                                  child: Container(
                                      child: Center(child: Text("back"))),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 20,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    for (int i = 0; i < leavelist.length; i++) {
                      _cardStateKeys[i].currentState.toggleCard();
                    }
                  },
                  color: Colors.grey,
                  textColor: Colors.white,
                  child: Text("Flip",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
      endDrawer: Container(
        width: 350,
        child: Drawer(
          child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.orange[600],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Setting".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Theme".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        " Change Pin".toUpperCase(),
                        style: TextStyle(
                            // color: Colors.brown[900],
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        "Profile".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "User".toUpperCase(),
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Sign out".toUpperCase(),
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, bottom: 30, right: 30),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox.fromSize(
                        size: Size(60, 60), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // button color
                            child: InkWell(
                              splashColor: Colors.cyan, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.clear,
                                      color: Colors.orange), // icon
                                  // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  List<GlobalKey<FlipCardState>> getCardStateKeys() {
    List<GlobalKey<FlipCardState>> cardStateKeys =
        new List<GlobalKey<FlipCardState>>();

    for (int i = 0; i < leavelist.length; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }

    return cardStateKeys;
  }
}
