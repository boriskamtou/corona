import 'package:corona_app/src/providers/corona_last_info_provider.dart';
import 'package:corona_app/src/screens/login_screen.dart';
import 'package:corona_app/src/screens/menu_screen.dart';
import 'package:corona_app/src/screens/register_screen.dart';
import 'package:corona_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CoronaLastInfoProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Corona Info',
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        home: MenuScreen(),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          MenuScreen.routeName: (ctx) => MenuScreen(),
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
        },
      ),
    );
  }
}
