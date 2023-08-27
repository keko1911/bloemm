import 'package:Bloem/Services/auth_service.dart';
import 'package:Bloem/my_tools/my_textfield.dart';
import 'package:Bloem/my_ui/forgot_pw_page.dart';
import 'package:Bloem/my_ui/my_tools/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'my_tools/constants.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign in method
  void signUserIn() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showErrorMessage(e.code);
    }
  }
  //wrong password or email

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(218, 207, 113, 1),
            title: Text(
              message,
              style: const TextStyle(
                color: Color.fromRGBO(33, 50, 68, 1),
                fontWeight: FontWeight.bold,
                fontFamily: 'NunitoSans',
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyBackgroundColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo

              Image.asset(
                'assets/images/my_logo.png',
                width: 250,
                height: 250,
              ),
              Align(
                alignment: Alignment.center,
              ),
              //Bloem
              const Text("B L O E M",
                  style: TextStyle(
                      fontSize: 45,
                      color: Color.fromRGBO(218, 207, 113, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NunitoSans')),
              const SizedBox(height: 40),

              //usernametextfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obsecureText: false,
              ),

              const SizedBox(height: 10),

              //passwordtextfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
              ),
              const SizedBox(height: 10),

              //forgotpassword?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgotPasswordPage();
                      })),
                      child: Text('Forgot Password?',
                          style: TextStyle(
                            color: Color.fromRGBO(231, 225, 210, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NunitoSans',
                          )),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              //signbutton
              MyButton(
                text: "S i g n I n",
                tap: signUserIn,
              ),

              const SizedBox(height: 50),

              //or continue with

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Or Continue with',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(218, 207, 113, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NunitoSans',
                          )),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //google sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => AuthService().signInWithGoogle(),
                    child: Image.asset(
                      'assets/images/Gicon.png',
                      height: 80,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //not a memeber? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(218, 207, 113, 1),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NunitoSans',
                      )),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text('Register Now',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(231, 225, 210, 1),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NunitoSans',
                        )),
                  )
                ],
              )
            ],
          ),
        )));
  }
}
