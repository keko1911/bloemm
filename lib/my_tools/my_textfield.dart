import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obsecureText;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: TextField(
          style: TextStyle(
            color: Color.fromRGBO(33, 50, 68, 1),
            fontWeight: FontWeight.bold,
            fontFamily: 'NunitoSans',
          ),
          controller: controller,
          obscureText: obsecureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Color.fromRGBO(218, 207, 113, 1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Color.fromRGBO(218, 207, 113, 1),
              ),
            ),
            fillColor: Color.fromRGBO(218, 207, 113, 1),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color.fromRGBO(33, 50, 68, 1),
              fontWeight: FontWeight.bold,
              fontFamily: 'NunitoSans',
            ),
          ),
        ));
  }
}
