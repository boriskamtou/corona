import 'package:corona_app/src/constants/colors.dart';
import 'package:corona_app/src/models/CoronaLastInfo.dart';
import 'package:corona_app/src/providers/corona_last_info_provider.dart';
import 'package:corona_app/src/widgets/menu_screen/botton_navigation_bar.dart';
import 'package:corona_app/src/widgets/menu_screen/custom_item.dart';
import 'package:corona_app/src/widgets/menu_screen/requirement_item.dart';
import 'package:corona_app/src/widgets/spacer/spacer.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = '/menu-screen';

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Future<CoronaLastInfo> coronaLastInfo;
  List<double> data;
  final _pageController = PageController(initialPage: 0);
  var _currentPage = 0;

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _currentPage,
          onPositionChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text('Covid - 19 Tracker'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PageView(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
              FutureBuilder<CoronaLastInfo>(
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

                    return Expanded(
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
                            imagePath: 'assets/images/death.png',
                            isInProgress: snapshot.data.is_in_progress,
                          ),
                          SpaceH10(),
                          CustomItem(
                            color: Colors.green,
                            title: 'Recovered',
                            value: snapshot.data.recovered,
                            imagePath: 'assets/images/recovery.png',
                            isInProgress: snapshot.data.is_in_progress,
                          ),
                          SpaceH10(),
                          CustomItem(
                            color: Color(0xFFB7A12E),
                            title: 'Active',
                            value: snapshot.data.active,
                            imagePath: 'assets/images/active.png',
                            isInProgress: snapshot.data.is_in_progress,
                          ),
                          SpaceH20(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Last cases',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  'More >',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SpaceH20(),
                          Container(
                            height: 80,
                            width: screenWidth,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              children: <Widget>[
                                RequirementItem(
                                  label: 'Deaths',
                                  value: snapshot.data.new_deaths,
                                ),
                                RequirementItem(
                                  label: 'Confirmed',
                                  value: snapshot.data.new_confirmed,
                                ),
                                RequirementItem(
                                  label: 'Recovery',
                                  value: snapshot.data.new_recovered,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'Erreur lors du changement des données.',
                      ),
                    );
                  }
                },
              ),
              Text('1'),
              Text('2'),
              Text('3'),
            ],
          ),
        ));
  }
}
