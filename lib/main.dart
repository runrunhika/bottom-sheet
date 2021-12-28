import 'package:flutter/material.dart';

import 'widget/bottom_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> questions = <String>[
    "How are you feeling today?",
    "What is your favourite color?",
    "Do you like Flutter?"
  ];

  final List<List<String>> options = [
    ['Great', 'Okay', 'Not Great'],
    ['red', 'blue', 'black'],
    ['Yes', 'No', 'soso']
  ];

  int question = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: Text("Bottom Sheet"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  question = 0;
                });
              },
              icon: Icon(Icons.open_in_new),
              label: Text("Open Sheet")),
        ),
        bottomSheet: question != -1
            ? BottomSheetWidget(
                title: questions[question],
                options: options[question],
                onClickedClose: () {
                  setState(() {
                    question = -1;
                  });
                },
                onClickedConfirm: () {
                  setState(() {
                    if (question >= questions.length - 1) {
                      question = -1;
                    } else {
                      question++;
                    }
                  });
                },
              )
            : null);
  }
}
