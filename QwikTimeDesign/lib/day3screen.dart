import 'package:QwikTimeDesign/MultiChoiceChips.dart';
import 'package:flutter/material.dart';

class Day3Screen extends StatefulWidget {
  @override
  _Day3ScreenState createState() => _Day3ScreenState();
}

class _Day3ScreenState extends State<Day3Screen> with TickerProviderStateMixin {
  List<String> _options = [
    'SE-Testing',
    'SE-Coding',
    'SE-Unit Test',
    'SE-Ui Design',
    'SE-Documentation',
    'SE-Meeting',
    'SE-Developement',
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
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: _options.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              sliderValue = 0;
              return _onSelected(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 50, top: 20),
              child: Container(
                // color: _selectedIndex != null && _selectedIndex == index
                //     ? Colors.cyan[100]
                //     : Colors.white,
                decoration: _selectedIndex != null && _selectedIndex == index
                    ? BoxDecoration(
                        color: _selectedIndex != null && _selectedIndex == index
                            ? Colors.cyan[100]
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        boxShadow: [
                            BoxShadow(
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(3, 3),
                              color: Colors.grey,
                            )
                          ])
                    : BoxDecoration(),
                width: MediaQuery.of(context).size.width,
                height: _selectedIndex != null && _selectedIndex == index
                    ? 110
                    : 100,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Expanded(
                            flex: 2,
                            child: Text(
                              "QWIKTIME",
                              style: TextStyle(
                                color: _selectedIndex != null &&
                                        _selectedIndex == index
                                    ? Colors.black45
                                    : Colors.grey,
                                fontSize: _selectedIndex != null &&
                                        _selectedIndex == index
                                    ? 18
                                    : 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 20),
                          child: Expanded(
                            flex: 2,
                            child: Text(
                              _options[index],
                              style: TextStyle(
                                color: _selectedIndex != null &&
                                        _selectedIndex == index
                                    ? Colors.black
                                    : Colors.black,
                                fontSize: _selectedIndex != null &&
                                        _selectedIndex == index
                                    ? 25
                                    : 20,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                              _selectedIndex != null && _selectedIndex == index
                                  ? SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: Colors.orange,
                                        inactiveTrackColor: Colors.white,
                                        thumbShape: RoundSliderThumbShape(
                                            enabledThumbRadius: 12.0),
                                        thumbColor: Colors.black54,
                                        overlayColor: Colors.red.withAlpha(32),
                                        overlayShape: RoundSliderOverlayShape(
                                            overlayRadius: 28.0),
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 250,
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
                                    )
                                  : Container(),
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 20),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          _selectedIndex != null && _selectedIndex == index
                              ? "0" + sliderValue.round().toString()
                              : "08",
                          style: TextStyle(
                              color: _selectedIndex != null &&
                                      _selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey[300],
                              fontSize: _selectedIndex != null &&
                                      _selectedIndex == index
                                  ? 70
                                  : 60,
                              shadows: [
                                _selectedIndex != null &&
                                        _selectedIndex == index
                                    ? Shadow(
                                        blurRadius: 8.0,
                                        color: Colors.grey,
                                        offset: Offset(-5.0, 5.0),
                                      )
                                    : Shadow(),
                              ],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        // separatorBuilder: (context, index) {
        //   return _selectedIndex != null && _selectedIndex == index
        //       ? Divider()
        //       : Padding(
        //           padding: const EdgeInsets.only(left: 20, right: 20),
        //           child: Divider(
        //             color: Colors.grey,
        //           ),
        //         );
        // },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
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
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
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
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                color: Colors.orange,
                                icon: Icon(
                                  Icons.done,
                                  color: Colors.orange,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 2),
            child: FlatButton(
              child: Text(
                "QwiktTime",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.cyan,
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
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.cyan,
              onPressed: () {
                _buildChips();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 3, left: 3),
            child: FlatButton(
              child: Text(
                "MedWeb",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.cyan,
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
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.cyan,
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
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.cyan,
              onPressed: () {
                _buildChips();
              },
            ),
          )
        ],
      ),
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
        selectedColor: Colors.blue,
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
