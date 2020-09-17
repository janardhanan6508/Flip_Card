import 'package:QwikTimeDesign/MultiChoiceChips.dart';
import 'package:QwikTimeDesign/model.dart';
import 'package:flutter/material.dart';

class TueDayScreen extends StatefulWidget {
  @override
  _TueDayScreenState createState() => _TueDayScreenState();
}

class _TueDayScreenState extends State<TueDayScreen> {
  List<String> _options = [
    'SE-Testing',
    'SE-Coding',
    'SE-Unit Test',
    'SE-Ui Design',
    'SE-Documentation',
    'SE-Meeting',
    'SE-Developement',
    'SE-Leave',
    'SE-Company Event',
    'SE-Requirement',
  ];
  List<MyButtonModal> _projectList = [
    MyButtonModal(buttonText: "Qwiktime"),
    MyButtonModal(buttonText: "Aspen"),
    MyButtonModal(buttonText: "Mid"),
    MyButtonModal(buttonText: "CIA"),
    MyButtonModal(buttonText: "Mamooth"),
  ];
  bool _visible = false;
  List<String> selectedReportList = List();
  int _selectedIndex = 0;
  double sliderValue = 0.0;
  _onSelected(int index) {
    setState(() {
      return _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: ListView.builder(
        itemCount: _options.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              sliderValue = 0;
              return _onSelected(index);
            },
            child: Row(
              children: [
                Container(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Text(
                        _selectedIndex != null && _selectedIndex == index
                            ? "0" + sliderValue.round().toString() + ":" + "30"
                            : "08:30",
                        style: TextStyle(
                            color: Color(0xFF364459),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "hrs",
                          style: TextStyle(
                            color: Color(0xFF364459),
                            fontSize: 16,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                )),
                SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15),
                    child: Container(
                      // color: _selectedIndex != null && _selectedIndex == index
                      //     ? Colors.cyan[100]
                      //     : Colors.white,
                      decoration: BoxDecoration(
                          color:
                              _selectedIndex != null && _selectedIndex == index
                                  ? Colors.cyan[100]
                                  : Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          boxShadow: [
                            _selectedIndex != null && _selectedIndex == index
                                ? BoxShadow()
                                : BoxShadow(
                                    spreadRadius: 3,
                                    blurRadius: 2,
                                    offset: Offset(3, 3),
                                    color: Colors.grey,
                                  )
                          ]),

                      width: MediaQuery.of(context).size.width * 5,
                      height: _selectedIndex != null && _selectedIndex == index
                          ? 110
                          : 100,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 20),
                                child: Expanded(
                                  flex: 2,
                                  child: Text(
                                    _options[index],
                                    style: TextStyle(
                                        color: _selectedIndex != null &&
                                                _selectedIndex == index
                                            ? Color(0xFF364459)
                                            : Color(0xFF364459),
                                        fontSize: _selectedIndex != null &&
                                                _selectedIndex == index
                                            ? 20
                                            : 18,
                                        fontWeight: _selectedIndex != null &&
                                                _selectedIndex == index
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 20),
                                child: Expanded(
                                  flex: 2,
                                  child: Text(
                                    "QwikTime",
                                    style: TextStyle(
                                      color: _selectedIndex != null &&
                                              _selectedIndex == index
                                          ? Colors.black87
                                          : Colors.grey,
                                      fontSize: _selectedIndex != null &&
                                              _selectedIndex == index
                                          ? 16
                                          : 15,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: _selectedIndex != null &&
                                        _selectedIndex == index
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SliderTheme(
                                            data: SliderTheme.of(context)
                                                .copyWith(
                                              activeTrackColor: Colors.orange,
                                              inactiveTrackColor: Colors.white,
                                              thumbShape: RoundSliderThumbShape(
                                                  enabledThumbRadius: 12.0),
                                              thumbColor: Colors.black54,
                                              overlayColor:
                                                  Colors.red.withAlpha(32),
                                              overlayShape:
                                                  RoundSliderOverlayShape(
                                                      overlayRadius: 28.0),
                                            ),
                                            child: Container(
                                              height: 40,
                                              width: 180,
                                              child: Slider(
                                                value: sliderValue,
                                                min: 0,
                                                max: 9,

                                                divisions: 9,
                                                // label: '$sliderValue',
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      sliderValue = value;
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "hrs",
                                            style: TextStyle(
                                                color: Color(0xFF364459),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ),
                            ],
                          ),
                          Container(
                              width: 100,
                              height: 100,
                              child: Image.asset('images/time_image.png',
                                  fit: BoxFit.cover)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Container(
        height: 40,
        child: FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {
              _settingModalBottomSheet(context);
            },
            child: Container(
              height: 20,
              child: Image.asset(
                "images/uparrow.png",
                fit: BoxFit.cover,
              ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.6,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              clipBehavior: Clip.hardEdge,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 60),
                                child: Text(
                                  "Select your work split for the day.",
                                  style: TextStyle(
                                      color: Color(0xFF364459),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      // Container(
                                      //    height: 20,

                                      //   child: IconButton(

                                      //     icon: Icon(
                                      //       Icons.done,
                                      //       color: Colors.white,
                                      //     ),
                                      //     onPressed: () {},
                                      //   ),
                                      // ),
                                      SizedBox.fromSize(
                                    size:
                                        Size(40, 40), // button width and height
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.orange, // button color
                                        child: InkWell(
                                          splashColor:
                                              Colors.cyan, // splash color
                                          onTap: () {}, // button pressed
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.done,
                                                color: Colors.white,
                                              ), // icon
                                              // text
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              Container(
                                child: new Wrap(
                                  children: <Widget>[_myListView(context)],
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                child: MultiSelectChip(
                                  _options,
                                  onSelectionChanged: (selectedList) {
                                    setState(() {
                                      selectedReportList = selectedList;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _myListView(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 35,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 2),
                child: FlatButton(
                  child: Text(
                    "QwiktTime",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    // Container(height: 30, child: _buildChips());
                    setState(() {
                      _visible = true;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 2),
                child: FlatButton(
                  child: Text(
                    "Aspen",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  color: Colors.cyan[100],
                  onPressed: () {
                    setState(() {});
                    _buildChips();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 3),
                child: FlatButton(
                  child: Text(
                    "MedWeb",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Container(height: 30, child: _buildChips());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 2, left: 2),
                child: FlatButton(
                  child: Text(
                    "CIA",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    _buildChips();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5, left: 3),
                child: FlatButton(
                  child: Text(
                    "Matrix It",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    _buildChips();
                  },
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey[200],
          ),
        )
      ],
    );
  }

  Widget _buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(_options[i], style: TextStyle(color: Colors.white)),
        elevation: 10,
        pressElevation: 2,
        backgroundColor: Colors.black54,
        selectedColor: Colors.orange,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
            }
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }
}
