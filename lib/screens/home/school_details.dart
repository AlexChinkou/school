import 'package:flutter/material.dart';
import 'package:flutter_school/screens/home/components/Bottom_Navigation_School.dart';
import 'package:flutter_school/screens/home/components/details.dart';
import 'package:flutter_school/screens/home/home.dart';

class Schooldetails extends StatelessWidget {
  const Schooldetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.blueAccent,
                    Colors.lightBlue,
                    Colors.blue[400],
                    Colors.blue[300],
                    Colors.blue[200],
                  ],
                ),
              ),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return BottomNavigationSchool(); // indique la page a suivre
                              },
                            ),
                          );
                        },
                        child: ListView(
                          padding: EdgeInsets.only(
                            top: 30,
                            left: 0,
                            right: 140,
                          ),
                          children: <Widget>[
                            Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Your School',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Primary school',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Details(); // indique la page a suivre
                      },
                    ),
                  );
                },
                child: ListView(
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 5,
                    right: 5,
                  ),
                  children: <Widget>[
                    Container(
                      height: 300,
                      width: size.width,
                      child: Card(
                        elevation: 8,
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  height: 190,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(9),
                                      topRight: Radius.circular(9),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/1.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(9),
                                        topRight: Radius.circular(9),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Primary school',
                                              style: TextStyle(
                                                color: Colors.lightBlue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  size: 20,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  'Messassi, Yaoundé',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //nexcard
                    Container(
                      height: 300,
                      width: size.width,
                      child: Card(
                        elevation: 8,
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  height: 190,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(9),
                                      topRight: Radius.circular(9),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/4.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(9),
                                        topRight: Radius.circular(9),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Primary school',
                                              style: TextStyle(
                                                color: Colors.lightBlue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  size: 20,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  'Messassi, Yaoundé',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ), //nexcard
                    Container(
                      height: 300,
                      width: size.width,
                      child: Card(
                        elevation: 8,
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  height: 190,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(9),
                                      topRight: Radius.circular(9),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/5.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(9),
                                        topRight: Radius.circular(9),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Primary school',
                                              style: TextStyle(
                                                color: Colors.lightBlue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  size: 20,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  'Balla 2, Yaoundé',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), //card
          ],
        ),
      ),
    );
  }
}
