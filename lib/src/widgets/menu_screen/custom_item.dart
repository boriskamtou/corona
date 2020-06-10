import 'package:corona_app/src/constants/colors.dart';
import 'package:flutter/material.dart';
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

  String converter(int num) {
    final newInt = num.toString();
    return newInt.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}, ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      child: Card(
        elevation: 4,
        color: Colors.white,
        shadowColor: Color(0xFFF8F8FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
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
                  Image.asset(
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
                    converter(value),
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
