import 'package:corona_app/src/constants/colors.dart';
import 'package:corona_app/src/models/CoronaLastInfo.dart';
import 'package:corona_app/src/providers/corona_last_info_provider.dart';
import 'package:corona_app/src/widgets/menu_screen/botton_navigation_bar.dart';
import 'package:corona_app/src/widgets/menu_screen/custom_item.dart';
import 'package:corona_app/src/widgets/menu_screen/requirement_item.dart';
import 'package:corona_app/src/widgets/spacer/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      bottomNavigationBar: MyBottomNavigationBar(),
      appBar: AppBar(
        elevation: 0,
        title: Text('Covid - 19 Tracker'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            width: screenWidth,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                      return Column(
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
                            isInProgress: snapshot.data.is_in_progress,
                          ),
                        ],
                      );
                    } else {
                      return Center(
                          child:
                              Text('Erreur lors du changement des données.'));
                    }
                  },
                ),
                SpaceH20(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Requirements',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      child: Text('More >'),
                    ),
                  ],
                ),
                SpaceH20(),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      RequirementItem(
                        imagePath: 'assets/images/gloves.png',
                        label: 'GLOVES',
                      ),
                      RequirementItem(
                        imagePath: 'assets/images/mask.png',
                        label: 'MASK',
                      ),
                      RequirementItem(
                        imagePath: 'assets/images/alcohol.png',
                        label: 'ALCOHOL',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
