// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_build_context_synchronously, must_be_immutable, curly_braces_in_flow_control_structures, unnecessary_string_interpolations
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnit/Pages/view_Result_Page.dart';
import 'package:learnit/Utils/color.dart';
import 'package:learnit/Utils/text.dart';

import 'signup_login.dart';

class Profile extends StatefulWidget {
  Profile({super.key, required this.name});
  String name;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser;
  bool isTheme = false;
  TextEditingController changedName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;
    var asp = MediaQuery.of(context).size.aspectRatio;
    return Scaffold(
      backgroundColor: Color(0xFF171617),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: hei * 0.07),
            Row(
              children: [
                SizedBox(width: wid * 0.05),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_rounded, color: iconColor),
                ),
                SizedBox(width: wid * 0.3),
                text('Profile', 24, iconColor, 3),
              ],
            ),
            SizedBox(height: hei * 0.05),
            Container(
              height: hei * 0.83,
              width: wid,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: hei * 0.16,
                        width: wid * 0.36,
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                height: hei * 0.17,
                                width: wid * 0.34,
                                decoration: BoxDecoration(
                                  color: iconColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: hei * 0.16,
                                width: wid * 0.33,
                                decoration: BoxDecoration(
                                  color: Color(0xFF171617),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: hei * 0.15,
                                width: wid * 0.3,
                                decoration: BoxDecoration(
                                  color: iconColor.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(Icons.person,
                                    color: textColor, size: 50),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: hei * 0.05,
                                width: wid * 0.1,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFA500),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(Icons.edit_outlined,
                                    color: textColor, size: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: hei * 0.02),
                    text(
                        '${FirebaseAuth.instance.currentUser!.displayName.toString()}',
                        22,
                        iconColor,
                        2),
                    text('${user!.email}', 18, iconColor, 1),
                    SizedBox(height: hei * 0.07),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Color(0xFF171617),
                                title: text(
                                    'Edit Profile', 24, Color(0xFFEFEBE0), 3),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: changedName,
                                      decoration: InputDecoration(
                                        hintText: widget.name,
                                        hintStyle: TextStyle(
                                            color: Color(0xFFEFEBE0)
                                                .withOpacity(0.5)),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: iconColor),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: iconColor),
                                        ),
                                      ),
                                      style: TextStyle(color: iconColor),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: text('Cancel', 18, iconColor, 2),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if (changedName.text.trim() != '')
                                          FirebaseAuth.instance.currentUser!
                                              .updateDisplayName(
                                                  changedName.text.trim());
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: text('Save', 18, iconColor, 2),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        height: hei * 0.05,
                        width: wid * 0.4,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFA500),
                          border: Border.all(color: Color(0xFFFFA500)),
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFA500).withOpacity(0.4),
                              Color(0xFFFFA500).withOpacity(0.3)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Center(
                          child: text('Edit Profile', asp * 40, iconColor, 2),
                        ),
                      ),
                    ),
                    SizedBox(height: hei * 0.1),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewResult()));
                      },
                      child: Container(
                        width: wid * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  //view the results of all the tests icon
                                  child: Icon(Icons.bar_chart_rounded,
                                      color: Color(0xFFFFA500), size: 30),
                                ),
                                SizedBox(width: wid * 0.05),
                                text('View your Results', 20, Color(0xFFEFEBE0),
                                    2),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Icon(Icons.chevron_right_rounded,
                                    color: Color(0xFFEFEBE0), size: 30),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: hei * 0.05),
                    Container(
                      width: wid * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(Icons.password_rounded,
                                      color: Color(0xFFFFA500), size: 30),
                                ),
                              ),
                              SizedBox(width: wid * 0.05),
                              text('Change Password', 20, Color(0xFFEFEBE0), 2),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.chevron_right_rounded,
                                  color: iconColor, size: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: hei * 0.05),
                    Row(
                      children: [
                        SizedBox(width: wid * 0.05),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.power_settings_new_rounded,
                              color: Color(0xFFFFA500), size: 30),
                        ),
                        SizedBox(width: wid * 0.05),
                        GestureDetector(
                            onTap: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SorL()));
                            },
                            child: text('Logout', 20, Colors.red, 2)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
