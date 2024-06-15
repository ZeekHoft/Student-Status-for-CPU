// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_status/pages/loginfo.dart';
import 'package:student_status/pages/sitebuttons.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String idnumber;
  final String college;

  HomePage(
      {Key? key,
      required this.email,
      required this.idnumber,
      required this.college})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//Color.fromARGB(241, 230, 190, 16) yellow
//Color.fromARGB(255, 16, 0, 59) deep blue
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => handleClick(item, context),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Logout')),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                Text(
                  widget.email,
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Text(
                  widget.idnumber,
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 15.0,
            ),
            ExtractButtons1(),
            ExtractButtons2(),
          ],
        ),
      ),
    );
  }
}

void handleClick(int item, BuildContext context) {
  switch (item) {
    case 0:
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => Log_in_information()),
          (route) => false);
      break;
  }
}
