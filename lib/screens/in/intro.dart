import 'package:flutter/material.dart';
import 'package:flutter_school/global.dart';
import 'package:flutter_school/screens/welcome/welcome_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _pageViewController = PageController();
  bool showPrevious = false;
  int _currentIndex = 0;
  _introPages() {
    return PageView.builder(
      onPageChanged: (value) {
        if (value == 0) {
          showPrevious = false;
        } else {
          showPrevious = true;
        }
        _currentIndex = value;
        setState(() {});
      },
      controller: _pageViewController,
      itemCount: introPages.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "${introPages[i]['title']}",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.lightBlue[400]),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "${introPages[i]['subtitle']}",
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  "${introPages[i]['image']}",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                showPrevious
                    ? TextButton(
                        child: Text("Previous"),
                        onPressed: () {
                          _pageViewController.previousPage(
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeIn);
                        },
                      )
                    : Container(),
                FlatButton(
                  child: Text("Skip"),
                  textColor: Colors.white,
                  color: Colors.lightBlue[400],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomeScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: _introPages(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                introPages.length,
                (index) => Container(
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? Colors.lightBlue[400] //coleur slideshow
                        : Colors.grey,
                    shape: _currentIndex == index
                        ? BoxShape.rectangle
                        : BoxShape.circle,
                    borderRadius: _currentIndex == index
                        ? BorderRadius.circular(9)
                        : null,
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  height: 10,
                  width: _currentIndex == index ? 25 : 16,
                ),
              ),
            ),
            SizedBox(
                height: 40,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    if (_pageViewController.page == introPages.length - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WelcomeScreen();
                          },
                        ),
                      );
                    } else {
                      _pageViewController.nextPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.lightBlue[400],
                            Colors.blue.shade400
                          ]),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Text(
                      "Next",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
