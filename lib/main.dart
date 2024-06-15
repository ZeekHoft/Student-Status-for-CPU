import 'package:flutter/material.dart';
import 'package:student_status/pages/home.dart';
import 'package:student_status/pages/loginfo.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/': (context) => Log_in_information(),
      '/home': (context) => HomePage(
            email: 'francisvince.jaca-22@cpu.edu.ph',
            idnumber: '22-2622-40',
            college: '',
          ),
    },
  ));
}
