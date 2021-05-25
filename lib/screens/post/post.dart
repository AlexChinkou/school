import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_school/services/crude.dart';
import 'package:image_picker/image_picker.dart';

class Postscreen extends StatefulWidget {
  @override
  _PostscreenState createState() => _PostscreenState();
}

class _PostscreenState extends State<Postscreen> {
  String schoolName, description, successRate, contacts, website;

  CrudMethods crudMethods = new CrudMethods();

  File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Create a",
              style: TextStyle(
                color: Colors.blue[200],
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              "Post",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                getImage(); //32:53min
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(6)),
                width: MediaQuery.of(context).size.width,
                child: Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: "School Name"),
                    onChanged: (value) {
                      schoolName = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Web site"),
                    onChanged: (value) {
                      website = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Contacts"),
                    onChanged: (value) {
                      contacts = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Success Rate"),
                    onChanged: (value) {
                      successRate = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Description"),
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
