import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/components/already_have_an_account_acheck.dart';
import 'package:flutter_school/components/rounded_button.dart';
import 'package:flutter_school/components/rounded_input_field.dart';
import 'package:flutter_school/components/rounded_password_field.dart';
import 'package:flutter_school/screens/home/home.dart';
import 'package:flutter_school/screens/login/components/background.dart';
import 'package:flutter_school/screens/signup/signup_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final auth = FirebaseAuth.instance;
  String email;
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
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
                fontSize: 40,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Positioned(
              child: Image.asset(
                "assets/images/k.png", // logo
                width: size.width * 0.70,
              ),
            ),
            RoundedInputField(
              hintText: "Enter your Email ",
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
              text: "LOGIN",
              press: () async {
                try {
                  final user = await auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if (user != null) {
                    Fluttertoast.showToast(
                        msg: ' Welcome back🤗🤗!',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.lightBlue[300],
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    Fluttertoast.showToast(
                        msg: ' Wrong Email or password, please try again !',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.lightBlue[300],
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else if (e.code == 'wrong-password') {
                    Fluttertoast.showToast(
                        msg: ' Wrong Email or password, please try again !',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.lightBlue[300],
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
