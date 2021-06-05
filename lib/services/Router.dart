import 'package:flutter/material.dart';
import 'package:soft_prodigy_assignment/screens/DashBoardScreen.dart';
import 'package:soft_prodigy_assignment/screens/SplashScreen.dart';
import 'package:soft_prodigy_assignment/utilities/router_constants.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DASHBOARD_SCREEN :
      return MaterialPageRoute(builder: (context) => DashBoardScreen());
      break;
    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());

  }
}
