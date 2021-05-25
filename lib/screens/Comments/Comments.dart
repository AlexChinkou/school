import 'package:flutter/material.dart';
import 'package:flutter_school/screens/Comments/components/ChatMessageListItem.dart';

class CommentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatMessageListItem(),
    );
  }
}
