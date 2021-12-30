import 'package:flutter/material.dart';

const kMainColor = Colors.pink;
const kGreyColor = Colors.grey;
double kDefPadding = 12;

TextStyle kButtonText = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5);

TextStyle kCaptionText = const TextStyle(
    color: kGreyColor,
    fontSize: 36,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5);

// AppBar myAppBar(String title) => AppBar(
//       elevation: 0,
//       title: Text(
//         title,
//         // style: appBarStyle,
//       ),
//       backgroundColor: Colors.teal,
//     );

Container createButton(String title) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 84.0,
      vertical: 12.0,
    ),
    decoration: BoxDecoration(
      color: kMainColor,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Text(
      title,
      style: kButtonText,
    ),
  );
}

InputDecoration inputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    hintText: "Enter your $label",
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 42,
      vertical: 20,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: kMainColor),
      gapPadding: 10,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: kMainColor),
      gapPadding: 10,
    ),
    labelStyle: const TextStyle(
      color: kGreyColor,
    ),
  );
}
