import 'package:flutter/material.dart';
import 'package:flutter_school/components/already_have_an_account_acheck.dart';
import 'package:flutter_school/components/rounded_button.dart';
import 'package:flutter_school/components/rounded_input_field.dart';
import 'package:flutter_school/components/rounded_password_field.dart';
import 'package:flutter_school/screens/home/home.dart';
import 'package:flutter_school/screens/login/components/background.dart';
import 'package:flutter_school/screens/signup/signup_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

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
              hintText: "Your Email or User Name",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
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
