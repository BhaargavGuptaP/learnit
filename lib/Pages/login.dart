// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print, unused_local_variable

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnit/Components/widget.dart';
import 'package:learnit/Pages/home.dart';
import 'package:learnit/Utils/color.dart';
import '../Utils/text.dart';
import 'signup.dart';
import 'signup_login.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    var asp = MediaQuery.of(context).size.aspectRatio;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SorL()));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: iconColor,
                ),
              ),
              SizedBox(width: wid * 0.8),
            ],
          ),
        ],
      ),
      backgroundColor: Color(0xFF171617),
      body: Container(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: hei * 0.05),
              lWithST(context),
              customTextBox(
                  asp, 'Email address', 'Email', Icons.email, email, false),
              SizedBox(height: hei * 0.01),
              customTextBox(asp, 'Password', 'Password', Icons.password_rounded,
                  password, true),
              SizedBox(height: hei * 0.1),
              GestureDetector(
                onTap: () async {
                  if (email.text.isNotEmpty && password.text.isNotEmpty) {
                    if (EmailValidator.validate(email.text) &&
                        (password.text.length >= 8)) {
                      try {
                        UserCredential? userCredential;

                        userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            )
                            .then((value) => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Home(
                                        name: FirebaseAuth
                                            .instance.currentUser!.displayName
                                            .toString()))));
                      } catch (e) {
                        print('sajbjhvcshjva');
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Please enter valid email and password'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please fill all the fields'),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, bottom: 20.0),
                  child: Container(
                    width: wid * 0.5,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFFFFA500)),
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
                      child: text('LOG IN', asp * 35, iconColor, 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: hei * 0.02),
              text('Forgot Password?', asp * 30, iconColor, 2),
              SizedBox(height: 5),
              text('or', asp * 25, Color(0xFFEFEBE0), 2),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text('Don\'t have an Account? ', asp * 30, Color(0xFFEFEBE0),
                      2),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: text('Sign Up', asp * 30, buttonDarkColor, 3),
                  ),
                ],
              ),
              SizedBox(height: hei * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  bool isPass = true;

  Column customTextBox(double asp, String upperText, String textHint,
      IconData icon, TextEditingController controller, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.0, bottom: 10.0),
          child: text(upperText, asp * 30, iconColor, 2),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
          child: TextField(
            controller: controller,
            style: TextStyle(color: Colors.white, fontSize: 12),
            cursorColor: Color(0xFFEFEBE0),
            decoration: InputDecoration(
              hintText: textHint,
              prefixIcon: Icon(
                icon,
                color: buttonDarkColor,
              ),
              suffixIcon: isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isPass = !isPass;
                        });
                      },
                      child: Icon(
                        !isPass
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: buttonDarkColor,
                      ),
                    )
                  : null,
              hintStyle: TextStyle(
                  color: Color(0xFFEFEBE0).withOpacity(0.5),
                  fontFamily: 'mont2',
                  fontSize: asp * 30),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFEFEBE0)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFEFEBE0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFEFEBE0)),
              ),
            ),
            obscureText: isPassword ? isPass : false,
          ),
        ),
      ],
    );
  }
}
