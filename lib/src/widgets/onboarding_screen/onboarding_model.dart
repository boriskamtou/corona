import 'package:flutter/material.dart';

class OnboardingModel extends StatelessWidget {
  final String imagePath;
  final String simpleTextOne;
  final String boldText1;
  final String simpleTextTwo;
  final String boldText2;
  final String subtitleText;
  const OnboardingModel({
    this.imagePath,
    this.simpleTextOne,
    this.boldText1,
    this.boldText2 = '',
    this.simpleTextTwo,
    this.subtitleText,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          imagePath,
          height: 250,
        ),
        SizedBox(
          height: 60,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '$simpleTextOne ',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '$boldText1 ',
                style: TextStyle(
                  color: Color(0xFF7777FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '$simpleTextTwo',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: ' $boldText2 ',
                style: TextStyle(
                  color: Color(0xFF7777FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          subtitleText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF707070),
            fontSize: 15,
            height: 1.5,
          ),
        )
      ],
    );
  }
}
