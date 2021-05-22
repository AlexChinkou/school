import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/models/user.dart';
import 'package:flutter_school/user%20page/utils/user_preferences.dart';
import 'package:flutter_school/user%20page/wiget/appbar_widget.dart';
import 'package:flutter_school/user%20page/wiget/profile_widget.dart';
import 'package:flutter_school/user%20page/wiget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'User Name',
                  text: user.username,
                  onChanged: (username) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full name',
                  text: user.fullname,
                  onChanged: (fullname) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Contact',
                  text: user.contact,
                  onChanged: (contact) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Location',
                  text: user.location,
                  onChanged: (location) {},
                ),
              ],
            ),
          ),
        ),
      );
}
