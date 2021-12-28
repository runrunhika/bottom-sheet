import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  final String title;
  final List<String> options;
  final VoidCallback onClickedConfirm;
  final VoidCallback onClickedClose;

  const BottomSheetWidget(
      {Key? key,
      required this.title,
      required this.options,
      required this.onClickedConfirm,
      required this.onClickedClose})
      : super(key: key);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            children: widget.options
                .map((option) => buildChip(option, context))
                .toList(),
          ),
          const SizedBox(
            height: 16,
          ),
          buildButtons()
        ],
      ),
    );
  }

  Widget buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              style: TextButton.styleFrom(primary: Colors.black),
              onPressed: widget.onClickedClose,
              child: Text("CLOSE")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: widget.onClickedConfirm,
              child: Text("CONFIRM"))
        ],
      );

  Widget buildChip(String option, BuildContext context) {
    final isSelected = selectedOption == option;
    final foregroundColor = isSelected ? Colors.white : Colors.black;
    final backgroundColor =
        isSelected ? Theme.of(context).primaryColor : Colors.white;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Chip(
        shape: StadiumBorder(
            side: BorderSide(color: Theme.of(context).primaryColor)),
        label: Text(
          option,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: foregroundColor),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
