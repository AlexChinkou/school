import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/services/crude.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class Postscreen extends StatefulWidget {
  @override
  _PostscreenState createState() => _PostscreenState();
}

class _PostscreenState extends State<Postscreen> {
  String schoolName, description, successRate, contacts, website;

  CrudMethods crudMethods = new CrudMethods();

  File image;
  final picker = ImagePicker();
  bool isLoading = false;
  get selectedImage => null;

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

  //envoi image a firebase storage
  uploadSchool() async {
    if (selectedImage != null) {
      setState(() {
        isLoading = true;
      });
      //envoi image a firebase storage
      Reference firebaseStoreRef = FirebaseStorage.instance
          .ref()
          .child("schoolImage")
          .child("${randomAlphaNumeric(9)}.jpg");
      final UploadTask task = firebaseStoreRef.putFile(selectedImage);
      var downloadUrl = await (await task).ref.getDownloadURL();
      print("this is url $downloadUrl");
      Map<String, String> schoolMap = {
        "imgUlr": downloadUrl,
        "authorName": schoolName,
        "decription": description,
        "success": successRate,
        "contact": contacts,
        "website": website,
      };

      crudMethods.addData(schoolMap).then((result) {
        Navigator.pop(context);
      });
    } else {}
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
              "Create a ",
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
      body: isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      getImage(); //32:53min
                    },
                    child: selectedImage != null
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.file(
                                selectedImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
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
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                uploadSchool();
              },
              child: Icon(
                Icons.upload_sharp,
                size: 65,
                color: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
