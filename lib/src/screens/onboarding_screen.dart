import 'package:corona_app/src/widgets/onboarding_screen/onboarding_model.dart';
import 'package:flutter/material.dart';

import 'package:corona_app/src/constants/strings.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
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
          ],
        ),
      ),
    );
  }
}
