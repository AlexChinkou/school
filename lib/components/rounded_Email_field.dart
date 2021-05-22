import 'package:flutter/material.dart';
import 'package:flutter_school/components/text_field_container.dart';
import 'package:flutter_school/constants.dart';

class RoundedEmailField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedEmailField({
    Key key,
    this.onChanged,
    String hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Your Email",
          icon: Icon(
            Icons.email,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
