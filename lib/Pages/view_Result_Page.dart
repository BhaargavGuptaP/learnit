// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnit/Utils/color.dart';
import 'package:learnit/Utils/firebase.dart';

class ViewResult extends StatelessWidget {
  const ViewResult({super.key});

  @override
  Widget build(BuildContext context) {
    var asp = MediaQuery.of(context).size.aspectRatio;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('View Result',
                  style: TextStyle(
                    color: Color(0xFFEFEBE0),
                    fontSize: asp * 45,
                    fontFamily: 'mont3',
                  )),
              GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close_rounded, color: Color(0xFFEFEBE0))),
            ],
          ),
          backgroundColor: Color(0xFF171617),
          elevation: 0,
        ),
        backgroundColor: Color(0xFF171617),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final user = snapshot.data;
              return user == null
                  ? Center(
                      child: Text('No Marks',
                          style: TextStyle(color: Color(0xFFEFEBE0))))
                  : buildUser(user, asp, w, h);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
          future: readUser(),
        ));
  }

  Future<UserModel?> readUser() async {
    final user = await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .doc('result')
        .get();
    return UserModel.fromJson(user.data()!);
  }

  Widget buildUser(UserModel user, double asp, double wid, double hei) {
    int total = user.noun +
        user.pronoun +
        user.verb +
        user.adjective +
        user.adverb +
        user.preposition +
        user.conjunction +
        user.interjection;
    return SizedBox(
      height: hei * 0.85,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Total Percentage',
              style: TextStyle(
                color: buttonDarkColor,
                fontFamily: 'mont2',
                fontSize: asp * 40,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: hei * 0.05,
              width: wid * 0.5,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Text(
                          '${total * 10}%',
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'mont2',
                            fontSize: asp * 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: CircularProgressIndicator(
                      value: total / 80,
                      color: Colors.blue,
                      backgroundColor: Color.fromARGB(131, 239, 235, 224),
                      strokeWidth: 10,
                      strokeAlign: 3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: hei * 0.05),
            Text(
              'Your Marks',
              style: TextStyle(
                color: buttonDarkColor,
                fontFamily: 'mont2',
                fontSize: asp * 40,
              ),
            ),
            Row(
              children: [
                markContainer(wid, asp, user.noun, 'Noun'),
                markContainer(wid, asp, user.pronoun, 'Pronoun'),
              ],
            ),
            Row(
              children: [
                markContainer(wid, asp, user.verb, 'Verb'),
                markContainer(wid, asp, user.adjective, 'Adjective'),
              ],
            ),
            Row(
              children: [
                markContainer(wid, asp, user.adverb, 'Adverb'),
                markContainer(wid, asp, user.preposition, 'Preposition'),
              ],
            ),
            Row(
              children: [
                markContainer(wid, asp, user.conjunction, 'Conjunction'),
                markContainer(wid, asp, user.interjection, 'Interjection'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container markContainer(double wid, double asp, int mark, String name) {
    return Container(
      width: wid * 0.4,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.13)),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.35),
            Colors.white.withOpacity(0.14)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(name,
              style: TextStyle(
                  color: Color(0xFFEFEBE0),
                  fontSize: asp * 35,
                  fontFamily: 'mont2')),
          SizedBox(height: 10),
          Text(
            '$mark/10',
            style: TextStyle(
                color: Color(0xFFEFEBE0),
                fontSize: asp * 25,
                fontFamily: 'mont2'),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 10,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFEBE0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    height: 10,
                    width: mark * 7.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Text('${mark * 10}%',
                  style: TextStyle(
                      color: Color(0xFFEFEBE0),
                      fontSize: asp * 25,
                      fontFamily: 'mont2')),
            ],
          ),
        ],
      ),
    );
  }
}
