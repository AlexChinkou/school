import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/screens/Comments/Comments.dart';
import 'package:flutter_school/screens/explore/explore.dart';
import 'package:flutter_school/user%20page/page/profile_page.dart';
import 'package:flutter_school/screens/home/home.dart';

class BottomNavigationSchool extends StatefulWidget {
  @override
  BottomNavigationSchoolState createState() => BottomNavigationSchoolState();
}

class BottomNavigationSchoolState extends State<BottomNavigationSchool> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    Explore(),
    CommentsScreen(),
    ProfilePage(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: onTabTapped, // new
        index: _currentIndex,
        letIndexChange: (index) => true,
        color: Colors.lightBlueAccent,
        backgroundColor: Colors.lightBlue[200],
        buttonBackgroundColor: Colors.blueAccent,
        height: 55,
        items: [
          Icon(
            Icons.home,
            size: 20,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            size: 20,
            color: Colors.white,
          ),
          Icon(
            Icons.add_circle_rounded,
            size: 20,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle,
            size: 20,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
/* body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
    );
  }
}
*/
