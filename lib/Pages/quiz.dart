// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:learnit/Pages/results.dart';
import 'package:learnit/Utils/color.dart';
import 'package:learnit/Utils/text.dart';

class Quiz extends StatefulWidget {
  Quiz(
      {super.key,
      required this.questions,
      required this.options,
      required this.answers,
      required this.quizName});
  List<String> questions;
  List<List<String>> options;
  List<String> answers;
  String quizName;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<List<bool>> isSelected = [
    [false, false, false, false],
    [false, false, false, false],
    [false, false, false, false],
    [false, false, false, false],
    [false, false, false, false],
    [false, false, false, false],
    [false, false, false, false],
    [false, false, false, false],
    [false, false, false, false],
    [false, false, false, false],
  ];
  List<String> userAnswers = ['', '', '', '', '', '', '', '', '', ''];
  int cnt = 0;
  @override
  Widget build(BuildContext context) {
    var asp = MediaQuery.of(context).size.aspectRatio;
    var wid = MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF171617),
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'QUIZ',
                  style: TextStyle(
                    color: Color(0xFFEFEBE0),
                    fontSize: asp * 60,
                    fontFamily: 'mont2',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(Icons.close_rounded,
                      color: Color(0xFFEFEBE0), size: 30),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Answer the following questions and submit the quiz to get your result',
              style: TextStyle(
                color: buttonDarkColor,
                fontSize: asp * 25,
                fontFamily: 'mont',
              ),
            ),
          ),
          SizedBox(height: 20),
          Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: hei * 0.8,
                  width: wid,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: wid * 0.9,
                            decoration: BoxDecoration(
                              color: Color(0xFF171617),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    SizedBox(width: 15),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Color.fromARGB(255, 53, 53, 53),
                                      ),
                                      child: Center(
                                        child: text(
                                            (index == 9 ? '' : '0') +
                                                (index + 1).toString(),
                                            asp * 25,
                                            Color(0xFFEFEBE0),
                                            2),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: text(widget.questions[index],
                                          asp * 25, Color(0xFFEFEBE0), 2),
                                    ),
                                    SizedBox(width: 15),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Container(
                                  margin: EdgeInsets.only(left: wid * 0.1),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      optionsButton(index, asp,
                                          widget.options[index][0], 0),
                                      SizedBox(height: 10),
                                      optionsButton(index, asp,
                                          widget.options[index][1], 1),
                                      SizedBox(height: 10),
                                      optionsButton(index, asp,
                                          widget.options[index][2], 2),
                                      SizedBox(height: 10),
                                      optionsButton(index, asp,
                                          widget.options[index][3], 3),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(left: 15, right: 15),
                                  child: Divider(
                                      color: Color(0xFFEFEBE0).withOpacity(0.5),
                                      thickness: 1),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        for (int i = 0; i < 4; i++) {
                                          isSelected[index][i] = false;
                                        }
                                        //remove the selected option from the userAnswers list
                                        userAnswers[widget.options.indexOf(
                                            widget.options[index])] = '';
                                        if (cnt != 0) cnt--;
                                      });
                                    },
                                    child: text('Clear Selection', asp * 25,
                                        Color(0xFFEFEBE0), 2),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          index != 9
                              ? SizedBox(height: 25)
                              : SizedBox(height: hei * 0.12),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: wid,
                  height: hei * 0.1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xFF171617),
                        Color(0xFF171617).withOpacity(0.7),
                        Color(0xFF171617).withOpacity(0.5),
                        Color(0xFF171617).withOpacity(0),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Color(0xFF171617),
                        child: GestureDetector(
                          onTap: () {
                            if (cnt == 10) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultPage(
                                            userAnswers: userAnswers,
                                            answers: widget.answers,
                                            quizName: widget.quizName,
                                          )));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: text(
                                      'Please answer all the questions',
                                      asp * 25,
                                      Color(0xFFEFEBE0),
                                      2),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: wid * 0.4,
                            height: hei * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFFA500).withOpacity(0.4),
                                  Color(0xFFFFA500).withOpacity(0.3)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                              ),
                              border: Border.all(
                                  color: Color(0xFFFFA500).withOpacity(0.5)),
                            ),
                            child: Center(
                                child: text(
                                    'Submit', asp * 30, Color(0xFFEFEBE0), 2)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row optionsButton(int index, double asp, String name, int optionNumber) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              for (int i = 0; i < 4; i++) {
                if (i == optionNumber)
                  isSelected[index][i] = true;
                else
                  isSelected[index][i] = false;
              }

              if (userAnswers[widget.options.indexOf(widget.options[index])] ==
                  '') cnt++;
              userAnswers[widget.options.indexOf(widget.options[index])] =
                  widget.options[index][optionNumber];
            });
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Color.fromARGB(255, 126, 125, 125)),
              color: isSelected[index][optionNumber]
                  ? buttonDarkColor
                  : Colors.transparent,
            ),
            child: Center(
              child: Icon(
                Icons.check_rounded,
                color: Color(0xFF171617),
                size: 13,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        text(
            name,
            asp * 25,
            isSelected[index][optionNumber]
                ? Color(0xFFEFEBE0)
                : Color.fromARGB(255, 126, 125, 125),
            2),
      ],
    );
  }
}
