import 'package:corona_app/src/constants/colors.dart';
import 'package:corona_app/src/widgets/spacer/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = '/menu-screen';

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('Covid - 19 Tracker'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Last update: 14:50:43',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CustomItem(
                    color: kRed,
                    title: 'Deaths',
                    value: '3, 452, 452',
                    imagePath: 'assets/icons/morgue.svg',
                  ),
                  SpaceH10(),
                  CustomItem(
                    color: Colors.green,
                    title: 'Recovery',
                    value: '3, 452, 452',
                    imagePath: 'assets/icons/recovery.svg',
                  ),
                  SpaceH10(),
                  CustomItem(
                    color: Colors.yellow,
                    title: 'Confirmed',
                    value: '3, 452, 452',
                    imagePath: 'assets/icons/fear.svg',
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

class CustomItem extends StatelessWidget {
  final Color color;
  final String title;
  final String value;
  final String imagePath;

  CustomItem({this.color, this.title, this.value, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      child: Card(
        elevation: 8,
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
              Text(
                value,
                style: TextStyle(
                  color: color,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
