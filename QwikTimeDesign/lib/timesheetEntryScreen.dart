import 'package:QwikTimeDesign/day3screen.dart';
import 'package:QwikTimeDesign/friday_screen.dart';
import 'package:QwikTimeDesign/model.dart';
import 'package:QwikTimeDesign/tue_day_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TimesheetEntryScreen extends StatefulWidget {
  @override
  _TimesheetEntryScreenState createState() => _TimesheetEntryScreenState();
}

class _TimesheetEntryScreenState extends State<TimesheetEntryScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex;
  List<String> _options = ['Qwiktime', 'Aspen', 'Mid', 'Mamooth'];

  List taps;
  @override
  void initState() {
    // taps = ["Mon", "Tue", "Wed", "Thue", "Fri", "Sat", "Sun"];
    _tabController = new TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(280),
          child: Container(
            color: Colors.white,
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 140,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.black54,
                                    size: 30,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'DAY',
                                                style: TextStyle(
                                                    color: Color(0xFF364459),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: " (hrs)",
                                                style: TextStyle(
                                                  color: Color(0xFF364459),
                                                  fontSize: 14,
                                                  // fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Text(
                                        //   "DAY",
                                        //   style: TextStyle(
                                        //       color: Color(0xFF364459),
                                        //       fontSize: 20,
                                        //       fontWeight: FontWeight.bold),
                                        // ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            "08:00",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: 50,
                                      child: VerticalDivider(
                                        color: Colors.blueGrey,
                                        width: 20,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'WEEK',
                                                style: TextStyle(
                                                    color: Color(0xFF364459),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: " (hrs)",
                                                style: TextStyle(
                                                  color: Color(0xFF364459),
                                                  fontSize: 14,
                                                  // fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Text(
                                        //   "WEEK",
                                        //   style: TextStyle(
                                        //       color: Color(0xFF364459),
                                        //       fontSize: 20,
                                        //       fontWeight: FontWeight.bold),
                                        // ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            "32:00",
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, top: 20),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  child: Image.asset(
                                    'images/user_image.png',
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, right: 10),
                                child: Container(
                                  height: 20,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      // side: BorderSide(color: Colors.red)
                                    ),
                                    onPressed: () {},
                                    color: Colors.cyan[800],
                                    textColor: Colors.white,
                                    child: Text("Submit".toUpperCase(),
                                        style: TextStyle(fontSize: 14)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[300],
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 3),
                      child: Text(
                        "03-Aug-2020",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: Container(
                      height: 90,
                      child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.white,
                        labelColor: Colors.black87,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            // color: Color(0xFF004272)
                            color: Colors.cyan[100]),
                        tabs: [
                          Align(
                            alignment: Alignment.center,
                            child: Tab(
                              child: Container(
                                height: 70,
                                width: 30,
                                child: Column(
                                  children: [
                                    Text(
                                      "Mon",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "03",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Tab(
                              child: Container(
                                height: 70,
                                width: 30,
                                child: Column(
                                  children: [
                                    Text(
                                      "Tue",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "04",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Tab(
                              child: Container(
                                height: 70,
                                width: 30,
                                child: Column(
                                  children: [
                                    Text(
                                      "Wed",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "05",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Tab(
                              child: Container(
                                height: 70,
                                width: 30,
                                child: Column(
                                  children: [
                                    Text(
                                      "Thu",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "06",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Tab(
                              child: Container(
                                height: 70,
                                width: 30,
                                child: Column(
                                  children: [
                                    Text(
                                      "Fri",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "07",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Tab(
                              child: Container(
                                height: 70,
                                width: 30,
                                child: Column(
                                  children: [
                                    Text(
                                      "Sat",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "08",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Tab(
                              child: Container(
                                height: 70,
                                width: 30,
                                child: Column(
                                  children: [
                                    Text(
                                      "Sun",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "09",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        controller: _tabController,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            TueDayScreen(),
            TueDayScreen(),
            TueDayScreen(),
            Container(),
            FriDayScreen(),
            Container(),
            Container(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
