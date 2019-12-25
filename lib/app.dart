import 'package:flutter/material.dart';

import './colors.dart';
import './cart.dart';
import './login.dart';
import './signup.dart';
import './checkout.dart';
import './bottom_nav_elements/mainpage.dart';
import './description.dart';
import './rough_map.dart';

class BlueApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blue',
      theme: _kBlueTheme,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      initialRoute: '/login',
      routes: {
        '/signup': (context) => SignUp(),
        '/main': (context) => MainPage(),
        '/description': (context) => Description(),
        '/cart': (context) => Cart(),
        '/checkout': (context) => Checkout(),
        '/rough': (context) => Rough(),
      },
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }
    return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => LoginPage(),
        fullscreenDialog: true);
  }
}

final ThemeData _kBlueTheme = _buildBlueTheme();

ThemeData _buildBlueTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: kBlueBlue150,
    primaryColor: kBlueteal100,
    buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kBlueGradienttop, textTheme: ButtonTextTheme.normal),
    scaffoldBackgroundColor: kBlueBackgroundWhite,
    cardColor: kBlueBackgroundWhite,
    textSelectionColor: kBlueBlue100,
    errorColor: kBlueErrorRed,
  );
}
