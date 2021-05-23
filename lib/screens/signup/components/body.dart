import 'package:flutter/material.dart';

import 'package:flutter_school/components/already_have_an_account_acheck.dart';
import 'package:flutter_school/components/rounded_Email_field.dart';
import 'package:flutter_school/components/rounded_button.dart';
import 'package:flutter_school/components/rounded_input_field.dart';
import 'package:flutter_school/components/rounded_password_field.dart';

import 'package:flutter_school/screens/login/login_screen.dart';
import 'package:flutter_school/screens/signup/components/background.dart';
import 'package:flutter_school/screens/signup/components/or_divider.dart';
import 'package:flutter_school/screens/signup/components/social_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  static const String id = 'Body';

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
                fontSize: 20,
              ),
            ),
            Positioned(
              child: Image.asset(
                "assets/images/l.jpg",
                width: size.width * 0.45,
              ),
            ),
            RoundedInputField(
              hintText: "User Name",
              onChanged: (value) {
                username = value;
              },
            ),
            RoundedEmailField(
              hintText: "Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {
                print(username);
                print(email);
                print(password);
              },
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/images/e.png",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/images/r.png",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/images/h.png",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
