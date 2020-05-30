import 'package:corona_app/src/constants/colors.dart';
import 'package:corona_app/src/models/CoronaLastInfo.dart';
import 'package:corona_app/src/providers/corona_last_info_provider.dart';
import 'package:corona_app/src/widgets/menu_screen/botton_navigation_bar.dart';
import 'package:corona_app/src/widgets/spacer/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = '/menu-screen';

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Future<CoronaLastInfo> coronaLastInfo;
  List<double> data;

  Future<void> refresh() {
    return coronaLastInfo =
        Provider.of<CoronaLastInfoProvider>(context, listen: false)
            .fetchCoronaLastInfo();
  }

  @override
  void initState() {
    super.initState();
    coronaLastInfo = Provider.of<CoronaLastInfoProvider>(context, listen: false)
        .fetchCoronaLastInfo();
    data = Provider.of<CoronaLastInfoProvider>(context, listen: false).deaths;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      bottomNavigationBar: MyBottomNavigationBar(),
      appBar: AppBar(
        elevation: 0,
        title: Text('Covid - 19 Tracker'),
        centerTitle: true,
      ),
      body: FutureBuilder<CoronaLastInfo>(
        future: coronaLastInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            /*    final updated_at = snapshot.data.getString('updated_at');
            final deaths = snapshot.data.getInt('deaths');
            final recovered = snapshot.data.getInt('recovered');
            final active = snapshot.data.getInt('active');

            final new_confirmed = snapshot.data.getInt('new_confirmed');
            final new_deaths = snapshot.data.getInt('new_deaths');
            final new_recovered = snapshot.data.getInt('new_recovered');
            final is_in_progress = snapshot.data.getBool('is_in_progress');*/

            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: refresh,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Last update: ${snapshot.data.updated_at.substring(11, 19)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          CustomItem(
                            color: kRed,
                            title: 'Deaths',
                            value: snapshot.data.deaths,
                            imagePath: 'assets/icons/morgue.svg',
                            isInProgress: snapshot.data.is_in_progress,
                          ),
                          SpaceH10(),
                          CustomItem(
                            color: Colors.green,
                            title: 'Recovered',
                            value: snapshot.data.recovered,
                            imagePath: 'assets/icons/recovery.svg',
                            isInProgress: snapshot.data.is_in_progress,
                          ),
                          SpaceH10(),
                          CustomItem(
                            color: Color(0xFFB7A12E),
                            title: 'Active',
                            value: snapshot.data.active,
                            imagePath: 'assets/icons/fear.svg',
                            isInProgress: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
                child: Text('Erreur lors du changement des données.'));
          }
        },
      ),
    );
  }
}

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
