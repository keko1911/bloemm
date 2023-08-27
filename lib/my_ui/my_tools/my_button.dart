import 'package:Bloem/my_tools/constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? tap;
  final String text;

  const MyButton({
    Key? key,
    required this.tap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
            color: MyIconColor, borderRadius: BorderRadius.circular(6)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(33, 50, 68, 1),
            fontWeight: FontWeight.bold,
            fontFamily: 'NunitoSans',
          ),
        )),
      ),
    );
  }
}
