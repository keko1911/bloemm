import 'package:Bloem/Services/auth_service.dart';
import 'package:Bloem/my_tools/my_textfield.dart';
import 'package:Bloem/my_ui/my_tools/my_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'my_tools/constants.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  //sign in method
  Future signUserUp() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Navigator.pop(context);
      } else {
        showErrorMessage("Passwords don't match!");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showErrorMessage(e.code);
    }
    addUserDetails(
      firstNameController.text.trim(),
      lastNameController.text.trim(),
      emailController.text.trim(),
    );
  }

  Future addUserDetails(
    String firstName,
    String lastName,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Firstname': firstName,
      'Lastname': lastName,
      'Email': email,
    });
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
              const SizedBox(height: 20),
              //Bloem
              const Text("B L O E M",
                  style: TextStyle(
                      fontSize: 45,
                      color: Color.fromRGBO(218, 207, 113, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NunitoSans')),
              const SizedBox(height: 50),

              MyTextField(
                controller: firstNameController,
                hintText: 'First Name',
                obsecureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: lastNameController,
                hintText: 'Last Name',
                obsecureText: false,
              ),
              const SizedBox(height: 10),

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
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obsecureText: true,
              ),
              const SizedBox(height: 10),

              const SizedBox(height: 25),

              //signbutton
              MyButton(
                text: "S i g n U p",
                tap: signUserUp,
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
                  Text('Already have an account?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(218, 207, 113, 1),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NunitoSans',
                      )),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text('Login Now',
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
