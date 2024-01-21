// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Column lwithT(BuildContext context) {
  var wid = MediaQuery.of(context).size.width;
  var asp = MediaQuery.of(context).size.aspectRatio;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'assets/img/Learn-it.png',
        height: 100,
        width: 100,
      ),
      SizedBox(height: 20),
      Text(
        "LEARN - IT",
        style: TextStyle(
          fontFamily: 'mont2',
          color: Colors.white,
          fontSize: asp * 90,
        ),
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: wid * 0.1,
            height: 1,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
            ),
          ),
          Text(
            ' PARTS.OF.SPEECH ',
            style: TextStyle(
                color: Colors.white, fontSize: asp * 35, fontFamily: 'mont2'),
          ),
          Container(
            width: wid * 0.1,
            height: 1,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Column lWithST(BuildContext context) {
  var wid = MediaQuery.of(context).size.width;
  var hei = MediaQuery.of(context).size.height;
  var asp = MediaQuery.of(context).size.aspectRatio;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/Learn-it.png', height: asp * 100),
          SizedBox(width: wid * 0.05),
          Text(
            "LEARN - IT",
            style: TextStyle(
              fontFamily: 'mont2',
              color: Colors.white,
              fontSize: asp * 75,
            ),
          ),
        ],
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: wid * 0.15,
            height: 1,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
          ),
          Text(
            ' PARTS.OF.SPEECH ',
            style: TextStyle(
                color: Colors.white, fontSize: asp * 30, fontFamily: 'mont2'),
          ),
          Container(
            width: wid * 0.15,
            height: 1,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: hei * 0.05),
    ],
  );
}
