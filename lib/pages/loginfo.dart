// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_status/pages/checkinfo.dart';
import 'package:student_status/pages/home.dart';

class Log_in_information extends StatefulWidget {
  const Log_in_information({super.key});

  @override
  State<Log_in_information> createState() => _Log_in_informationState();
}

//Color.fromARGB(241, 230, 190, 16) yellow
//Color.fromARGB(255, 16, 0, 59) deep blue
//Colors.yellow[600],

class _Log_in_informationState extends State<Log_in_information> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCPU = TextEditingController();
  TextEditingController idnumberCPU = TextEditingController();
  TextEditingController courseyearCPU = TextEditingController();
  bool validEmail = false;
  bool validIDnumber = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.orange,
              Colors.white,
              // Color.fromARGB(240, 255, 213, 26),
              // Color.fromARGB(255, 22, 3, 77),
            ])),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Student Status",
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 22, 3, 77),
                            Color.fromARGB(240, 255, 213, 26),
                            Colors.orange,
                            Colors.white
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
                    child: Column(
                      children: [
                        Padding(
                          //Student Email section
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: emailCPU,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(241, 230, 190, 16),
                                      width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 16, 0, 59),
                                      width: 2.0),
                                ),
                                labelText: "CPU Email",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "jackcyrus.jaden-23@cpu.edu.ph",
                                hintStyle: TextStyle(color: Colors.white)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your cpu email";
                              } else
                                return null;
                            },
                            onChanged: (value) {
                              validateEmailAddress(value);
                              {
                                if (value.isEmpty) {
                                  setState(() {
                                    validEmail = true;
                                  });
                                } else {
                                  final isValid = validateEmailAddress(value);
                                  if (isValid) {
                                    setState(() {
                                      validEmail = true;
                                    });
                                  } else {
                                    setState(() {
                                      validEmail = false;
                                    });
                                  }
                                }
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12.0),
                          child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              style: TextStyle(color: Colors.white),
                              controller: idnumberCPU,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(241, 230, 190, 16),
                                        width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 16, 0, 59),
                                        width: 2.0),
                                  ),
                                  labelText: "ID number",
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintText: "99-9999-99",
                                  hintStyle: TextStyle(color: Colors.white)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your ID number";
                                } else
                                  return null;
                              },
                              onChanged: (value) {
                                validateIDNumber(value);
                                {
                                  {
                                    if (value.isEmpty) {
                                      setState(() {
                                        validIDnumber = true;
                                      });
                                    } else {
                                      final isValid = validateIDNumber(value);
                                      if (isValid) {
                                        setState(() {
                                          validIDnumber = true;
                                        });
                                      } else {
                                        setState(() {
                                          validIDnumber = false;
                                        });
                                      }
                                    }
                                  }
                                }
                              }),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12.0),
                            child: Center(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    String studentEmail = emailCPU.text;
                                    String studentID = idnumberCPU.text;
                                    String studentCollege = courseyearCPU.text;
                                    print(studentEmail);
                                    print(validEmail);
                                    print(studentID);

                                    if (validateEmailAddress(studentEmail) &&
                                        validateIDNumber(studentID)) {
                                      _formKey.currentState?.reset();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage(
                                                email: studentEmail,
                                                idnumber: studentID,
                                                college: studentCollege)),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Please input the correct format")),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Please fill in all the information")),
                                    );
                                  }
                                },
                                icon: Icon(
                                  Icons.check_box,
                                  color: Color.fromARGB(255, 16, 0, 59),
                                ),
                                label: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Color.fromARGB(241, 230, 190, 16)),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
