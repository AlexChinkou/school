import 'package:flutter/material.dart';
import 'package:flutter_school/components/rounded_button.dart';
import 'package:flutter_school/constants.dart';
import 'package:flutter_school/screens/login/login_screen.dart';
import 'package:flutter_school/screens/signup/signup_screen.dart';
import 'package:flutter_school/screens/welcome/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
                fontSize: 30,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Positioned(
              child: Image.asset(
                "assets/images/df.png", // logo
                width: size.width * 0.45,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen(); // indique la page a suivre
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.lightBlue,
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
            ),
          ],
        ),
      ),
    );
  }
}