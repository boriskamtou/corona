import 'package:corona_app/src/screens/login_screen.dart';
import 'package:corona_app/src/widgets/onboarding_screen/onboarding_model.dart';
import 'package:flutter/material.dart';

import 'package:corona_app/src/constants/strings.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController(initialPage: 0);
  final int _numPage = 4;
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];

    for (int i = 0; i < _numPage; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }

    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: isActive ? 16 : 8,
      width: isActive ? 16 : 8,
      decoration: isActive
          ? BoxDecoration(
              border: Border.all(
                width: 2.5,
                color: Color(0xFF7777FF),
              ),
              shape: BoxShape.circle,
            )
          : BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF979797),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.only(
          bottom: 16,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: <Widget>[
                  OnboardingModel(
                    imagePath: 'assets/images/img1.png',
                    simpleTextOne: 'Avoid',
                    boldText1: 'Close',
                    simpleTextTwo: 'Contact',
                    subtitleText: kOnboardingText1,
                  ),
                  OnboardingModel(
                    imagePath: 'assets/images/img2.png',
                    simpleTextOne: 'Clean your',
                    boldText1: 'Hands',
                    simpleTextTwo: 'Often',
                    subtitleText: kOnboardingText2,
                  ),
                  OnboardingModel(
                    imagePath: 'assets/images/img3.png',
                    simpleTextOne: 'Wear a',
                    boldText1: 'facemask',
                    simpleTextTwo: 'if you \nare',
                    boldText2: 'Sick',
                    subtitleText: kOnboardingText3,
                  ),
                  OnboardingModel(
                    imagePath: 'assets/images/img4.png',
                    simpleTextOne: 'Stay at',
                    boldText1: 'Home',
                    simpleTextTwo: '',
                    subtitleText: kOnboardingText4,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        _numPage - 1,
                        duration: Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.easeIn,
                      );
                    },
                    padding: EdgeInsets.zero,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF707070),
                      ),
                    ),
                  ),
                  Row(
                    children: _buildPageIndicator(),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_currentPage == _numPage - 1) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginScreen.routeName, (route) => false);
                      }
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    elevation: 0.75,
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
