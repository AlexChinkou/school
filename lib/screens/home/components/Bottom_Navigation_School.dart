import 'package:flutter/material.dart';
import 'package:flutter_school/screens/explore/explore.dart';
import 'package:flutter_school/user%20page/page/profile_page.dart';

import 'package:flutter_school/user%20page/wiget/profile_widget.dart';
import 'package:flutter_school/screens/home/home.dart';

class BottomNavigationSchool extends StatefulWidget {
  @override
  BottomNavigationSchoolState createState() => BottomNavigationSchoolState();
}

class BottomNavigationSchoolState extends State<BottomNavigationSchool> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Explore")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Profile")),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (nValue) {
          switch (nValue) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen(); // indique la page a suivre
                  },
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Explore(); // indique la page a suivre
                  },
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage(); // indique la page a suivre
                  },
                ),
              );
              break;
          }
        },
      ),
    );
  }
}
