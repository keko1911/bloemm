import 'package:Bloem/my_tools/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../my_tools/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  Future<dynamic> passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                "Password Reset Link Sent! Check Your Email",
                style: TextStyle(
                  color: Color.fromRGBO(33, 50, 68, 1),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NunitoSans',
                ),
              ),
              backgroundColor: Color.fromRGBO(218, 207, 113, 1),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                e.message.toString(),
                style: TextStyle(
                  color: Color.fromRGBO(33, 50, 68, 1),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NunitoSans',
                ),
              ),
              backgroundColor: Color.fromRGBO(218, 207, 113, 1),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: MyBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Enter Your Email',
              style: TextStyle(
                color: MyTextColor,
                fontWeight: FontWeight.w800,
                fontSize: 20,
                fontFamily: 'NunitoSans',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MyTextField(
              controller: _emailController,
              hintText: 'Email',
              obsecureText: false,
            ),
          ),
          MaterialButton(
            onPressed: passwordReset,
            child: Text(
              'Reset Password',
              style: TextStyle(
                color: MyBackgroundColor,
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.w800,
              ),
            ),
            color: MyIconColor,
          )
        ],
      ),
    );
  }
}
