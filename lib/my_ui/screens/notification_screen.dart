import 'package:Bloem/my_ui/root_page.dart';
import 'package:flutter/material.dart';

import '../../my_tools/constants.dart';
import '../my_tools/my_button.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  DateTime event = DateTime.now();
  DateTime currentDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  void showErrorMessage(String m) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(218, 207, 113, 1),
            title: Text(
              m,
              style: const TextStyle(
                color: Color.fromRGBO(33, 50, 68, 1),
                fontWeight: FontWeight.bold,
                fontFamily: 'NunitoSans',
              ),
            ),
          );
        });
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ).then((value) {
      if (value != null) {
        setState(() {
          event = value;

          if (event.isAtSameMomentAs(currentDate)) {
            showErrorMessage('Happy Anniversary');
          } else if (event.isAfter(currentDate)) {
            int daysLeft = event.difference(currentDate).inDays;
            showErrorMessage('$daysLeft Days Left');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(builder: (context) => new RootPage()),
                    (route) => false);
              },
              icon: Icon(Icons.arrow_back),
              color: Color.fromRGBO(218, 207, 113, 1),
            ),
            SizedBox(
              width: 90,
            ),
            Text(
              "B L O E M",
              style: TextStyle(
                color: Color.fromRGBO(218, 207, 113, 1),
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      backgroundColor: MyBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            //Bloem

            const SizedBox(height: 20),
            const Text(" A N N I V E R S A R Y",
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(218, 207, 113, 1),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NunitoSans')),
            const SizedBox(height: 50),
            const SizedBox(height: 20),

            MyButton(
              text: "C h o o s e D a t e",
              tap: _showDatePicker,
            ),
            const SizedBox(height: 50),
            const SizedBox(height: 50),
            const Text(" ANNIVERSARY DATE",
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(218, 207, 113, 1),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NunitoSans')),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                children: [
                  Text(
                    event.day.toString(),
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(218, 207, 113, 1),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NunitoSans'),
                  ),
                  Text('/',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(218, 207, 113, 1),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NunitoSans')),
                  Text(event.month.toString(),
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(218, 207, 113, 1),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NunitoSans')),
                  Text('/',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(218, 207, 113, 1),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NunitoSans')),
                  Text(event.year.toString(),
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(218, 207, 113, 1),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NunitoSans')),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                      (event.difference(currentDate).inDays)
                              .round()
                              .toString() +
                          ' Days',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(218, 207, 113, 1),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NunitoSans'))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
