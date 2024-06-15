// ignore_for_file: prefer_const_declarations, prefer_const_constructors, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//no fucking idea how this made into a function... HAHAHAH just extracted it from home.dart and
//copy pasted this code here

Row ExtractButtons1() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
        icon: Icon(Icons.bookmarks_rounded, size: 50.0),
        onPressed: () async {
          final url = "https://cpu.instructure.com";
          if (await canLaunchUrl(Uri.parse(url))) {
            await launch(url,
                forceSafariVC: true,
                forceWebView: true,
                enableJavaScript: true);
          }
        },
      ),
      SizedBox(width: 10.0),
      const Text(
        "Log in to our canvas",
        style: TextStyle(
            letterSpacing: 2.0, fontSize: 14.0, fontStyle: FontStyle.italic),
      ),
      SizedBox(height: 20.0),
    ],
  );
}

Row ExtractButtons2() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
        icon: Icon(Icons.person_2_rounded, size: 50.0),
        onPressed: () async {
          final url = "https://my.cpu.edu.ph/Membership/Login?ReturnUrl=%2fSOS";
          if (await canLaunchUrl(Uri.parse(url))) {
            await launch(url,
                forceSafariVC: true,
                forceWebView: true,
                enableJavaScript: true);
          }
        },
      ),
      SizedBox(width: 10.0),
      const Text(
        "See your status",
        style: TextStyle(
            letterSpacing: 2.0, fontSize: 14.0, fontStyle: FontStyle.italic),
      ),
      SizedBox(height: 20.0),
    ],
  );
}
