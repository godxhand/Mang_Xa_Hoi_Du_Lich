import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final int minLines;
  final Icon icon;
  final TextEditingController txt;
  MyTextField(
      {required this.label,
      this.maxLines = 1,
      this.minLines = 1,
      required this.icon,
      required this.txt});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txt,
      style: TextStyle(color: Colors.black87),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
          suffixIcon: icon == null ? null : icon,
          labelText: label,
          labelStyle: TextStyle(color: Colors.black45),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          border: UnderlineInputBorder(
              borderSide: txt == null
                  ? BorderSide(color: Colors.red)
                  : BorderSide(color: Colors.grey))),
    );
  }
}
