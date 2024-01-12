// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnit/Components/widget.dart';
import 'package:learnit/Pages/home.dart';
import 'package:learnit/Pages/login.dart';
import 'package:learnit/Pages/signup.dart';
import 'package:learnit/Utils/color.dart';

class SorL extends StatefulWidget {
  const SorL({super.key});

  @override
  State<SorL> createState() => _SorLState();
}

class _SorLState extends State<SorL> {
  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Scaffold(
                  backgroundColor: Color(0xFF171617),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        lwithT(context),
                        SizedBox(height: 150),
                        Container(
                          width: wid * 0.8,
                          height: 50,
                          decoration: BoxDecoration(
                            color: buttonDarkColor,
                            border: Border.all(color: Color(0xFFFFA500)),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFFA500).withOpacity(0.4),
                                Color(0xFFFFA500).withOpacity(0.3)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUp()));
                            },
                            child: Center(
                              child: Text(
                                'CREATE AN ACCOUNT',
                                style: TextStyle(
                                  fontFamily: 'mont3',
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: wid * 0.8,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LogIn()));
                            },
                            child: Center(
                              child: Text(
                                'I have an account',
                                style: TextStyle(
                                  fontFamily: 'mont2',
                                  color: Color(0xFFFFA500),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Home(
                  name:
                      FirebaseAuth.instance.currentUser!.displayName.toString(),
                );
        });
  }
}
