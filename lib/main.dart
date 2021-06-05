import 'package:flutter/material.dart';
import 'package:soft_prodigy_assignment/services/NavigationService.dart';
import 'package:soft_prodigy_assignment/services/Router.dart' as router;
import 'package:soft_prodigy_assignment/services/Locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(26, 42, 68, 1.0),
        fontFamily: 'Gothic',
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
    );
  }
}
