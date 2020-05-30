import 'package:corona_app/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomItem extends StatelessWidget {
  final Color color;
  final String title;
  final int value;
  final String imagePath;
  final bool isInProgress;

  CustomItem({
    this.color,
    this.title,
    this.value,
    this.imagePath,
    this.isInProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      child: Card(
        elevation: 4,
        color: kHintBlue,
        shadowColor: kIndigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SvgPicture.asset(
                    imagePath,
                    width: 50,
                    color: color,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      isInProgress
                          ? Icon(
                              FontAwesomeIcons.chartLine,
                              color: color,
                            )
                          : Transform.rotate(
                              angle: 90,
                              child: Icon(
                                FontAwesomeIcons.chartLine,
                                color: color,
                              ),
                            ),
                      SizedBox(
                        width: 5,
                      ),
                      isInProgress
                          ? Text(
                              'In progress',
                              style: TextStyle(
                                fontSize: 16,
                                color: color,
                              ),
                            )
                          : Text(
                              'In regress',
                              style: TextStyle(
                                fontSize: 16,
                                color: color,
                              ),
                            ),
                    ],
                  ),
                  Text(
                    value.toString(),
                    style: TextStyle(
                      color: color,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
