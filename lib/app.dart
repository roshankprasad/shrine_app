import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class ShrineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }
    return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          return LoginPage();
        },
        fullscreenDialog: true);
  }
}
