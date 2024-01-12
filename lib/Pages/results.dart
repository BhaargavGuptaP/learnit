// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnit/Utils/color.dart';

import 'home.dart';

class ResultPage extends StatefulWidget {
  ResultPage(
      {super.key,
      required this.userAnswers,
      required this.answers,
      required this.quizName});
  List<String> userAnswers;
  List<String> answers;
  String quizName;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  int c = 0;
  @override
  void initState() {
    for (int i = 0; i < widget.userAnswers.length; i++) {
      if (widget.userAnswers[i] == widget.answers[i]) {
        c++;
        print(widget.answers[i]);
      }
    }
    final docUser = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email ?? 'user')
        .doc('result');
    docUser.update({widget.quizName: c});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    var asp = MediaQuery.of(context).size.aspectRatio;
    return Scaffold(
      backgroundColor: Color(0xFF171617),
      appBar: AppBar(
        title: Text('Results', style: TextStyle(color: Color(0xFFEFEBE0))),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                          name: FirebaseAuth.instance.currentUser!.displayName
                              .toString())));
            },
            child:
                Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFEFEBE0)),
          ),
          SizedBox(width: 20),
        ],
        backgroundColor: Color(0xFF171617),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text('Your Answers',
              style: TextStyle(
                  color: Color(0xFFEFEBE0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color(0xFFEFEBE0).withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: hei * 0.4,
                  width: wid * 0.9,
                  child: ListView.builder(
                    physics: ScrollPhysics(),
                    itemCount: widget.userAnswers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                (index + 1).toString() +
                                    '.  ' +
                                    widget.userAnswers[index],
                                style: TextStyle(
                                    color: (widget.answers[index] ==
                                            widget.userAnswers[index])
                                        ? Colors.green
                                        : Colors.red)),
                            Icon(
                                (widget.answers[index] ==
                                        widget.userAnswers[index])
                                    ? Icons.check_rounded
                                    : Icons.close_rounded,
                                color: (widget.answers[index] ==
                                        widget.userAnswers[index])
                                    ? Colors.green
                                    : Colors.red),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )),
          SizedBox(height: 20),
          Text('Your Score in ${widget.quizName}',
              style: TextStyle(
                  color: Color(0xFFEFEBE0),
                  fontSize: asp * 40,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text((c * 10).toString() + '%',
              style: TextStyle(
                  color: buttonDarkColor,
                  fontSize: asp * 50,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 40),
          Container(
            width: wid * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Correct Answers',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: asp * 30,
                            fontWeight: FontWeight.bold)),
                    Text('$c/10',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: asp * 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    CircularProgressIndicator(
                      value: c / 10,
                      backgroundColor: Color(0xFFEFEBE0),
                      color: Colors.green,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Incorrect Answers',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: asp * 30,
                            fontWeight: FontWeight.bold)),
                    Text('${10 - c}/10',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: asp * 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    CircularProgressIndicator(
                      value: (10 - c) / 10,
                      backgroundColor: Color(0xFFEFEBE0),
                      color: Colors.red,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
