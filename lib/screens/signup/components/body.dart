import 'package:flutter/material.dart';

import 'package:flutter_school/components/already_have_an_account_acheck.dart';
import 'package:flutter_school/components/rounded_Email_field.dart';
import 'package:flutter_school/components/rounded_button.dart';
import 'package:flutter_school/components/rounded_input_field.dart';
import 'package:flutter_school/components/rounded_password_field.dart';
import 'package:flutter_school/screens/home/home.dart';

import 'package:flutter_school/screens/login/login_screen.dart';
import 'package:flutter_school/screens/signup/components/background.dart';
import 'package:flutter_school/screens/signup/components/or_divider.dart';
import 'package:flutter_school/screens/signup/components/social_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatefulWidget {
  static const String id = 'Bodt';

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String username;
  String password;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              press: () async {
                print(username);
                print(email);
                print(password);

                if (usernameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  print('empty');

                  Fluttertoast.showToast(
                      msg: 'Fill the Fields !',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.lightBlue,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (emailController.text.contains(RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                  print('error de mail');
                } else if (passwordController.text.length < 7) {
                  print('password must contains 7 char');
                } else {
                  try {
                    await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password)
                        .then((userCredential) {
                      if (userCredential.user.email != null) {
                        Fluttertoast.showToast(
                            msg: 'registration success',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightBlue,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      } else {
                        Fluttertoast.showToast(
                            msg: 'registration failed',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightBlue,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    });
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                }
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
