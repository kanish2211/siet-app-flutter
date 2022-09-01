import 'package:flutter/material.dart';
import 'package:siet_app/widgets/customDrawer.dart';

class Suggestion extends StatelessWidget {
  Suggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 36, 111, 37),
          title: const Text("Suggestion"),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return SuggestionWebView(
                    maxWidth: constraints.maxWidth,
                    maxHeight: constraints.maxHeight);
                ;
              } else {
                return SuggestionMobileView(
                    maxWidth: constraints.maxWidth,
                    maxHeight: constraints.maxHeight);
              }
            },
          ),
        ),
        drawer: const CustomDrawer());
  }
}

class SuggestionWebView extends StatefulWidget {
  const SuggestionWebView(
      {Key? key, required this.maxHeight, required this.maxWidth})
      : super(key: key);
  final double maxWidth;
  final double maxHeight;

  @override
  State<SuggestionWebView> createState() => _SuggestionWebViewState();
}

class _SuggestionWebViewState extends State<SuggestionWebView> {
  bool anonymous = false;
  String dropdownValue1 = 'Choose one';
  String dropdownValue2 = 'Choose one';
  String dropdownValue3 = 'Choose one';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: widget.maxHeight * 0.05,
            horizontal: widget.maxWidth * 0.1),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: anonymous,
                onChanged: (bool? value) {
                  if (value != null) {
                    setState(() {
                      anonymous = value;
                    });
                  }
                },
              ),
              const Text(
                "Go Anonymous",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Container(
            child: anonymous == false
                ? const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 31, 94, 37)))),
                    ),
                  )
                : Text(""),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: dropdownValue1,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  elevation: 10,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue1 = newValue!;
                    });
                  },
                  items: <String>['Choose one', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropdownValue2,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  elevation: 10,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue2 = newValue!;
                    });
                  },
                  items: <String>['Choose one', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropdownValue3,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  elevation: 10,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue3 = newValue!;
                    });
                  },
                  items: <String>['Choose one', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const TextField(
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "Describe the complaint breifly",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 31, 94, 37))))),
        ]),
      ),
    );
  }
}

class SuggestionMobileView extends StatefulWidget {
  const SuggestionMobileView(
      {Key? key, required this.maxHeight, required this.maxWidth})
      : super(key: key);
  final double maxWidth;
  final double maxHeight;

  @override
  SuggestionMobileViewState createState() => SuggestionMobileViewState();
}

class SuggestionMobileViewState extends State<SuggestionMobileView> {
  bool anonymous = false;
  String dropdownValue1 = 'Choose one';
  String dropdownValue2 = 'Choose one';
  String dropdownValue3 = 'Choose one';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: widget.maxHeight * 0.05,
            horizontal: widget.maxWidth * 0.05),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: anonymous,
                onChanged: (bool? value) {
                  if (value != null) {
                    setState(() {
                      anonymous = value;
                    });
                  }
                },
              ),
              const Text(
                "Go Anonymous",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Container(
            child: anonymous == false
                ? const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 31, 94, 37)))),
                    ),
                  )
                : Text(""),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: dropdownValue1,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  elevation: 10,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue1 = newValue!;
                    });
                  },
                  items: <String>['Choose one', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropdownValue2,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  elevation: 10,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue2 = newValue!;
                    });
                  },
                  items: <String>['Choose one', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropdownValue3,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  elevation: 10,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue3 = newValue!;
                    });
                  },
                  items: <String>['Choose one', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const TextField(
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "Describe the complaint breifly",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 31, 94, 37))))),
        ]),
      ),
    );
  }
}
