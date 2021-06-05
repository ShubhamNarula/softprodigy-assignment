import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soft_prodigy_assignment/services/Locator.dart';
import 'package:soft_prodigy_assignment/services/NavigationService.dart';
import 'package:soft_prodigy_assignment/utilities/ClassMediaQuery.dart';
import 'package:soft_prodigy_assignment/utilities/ImageConstants.dart';
import 'package:soft_prodigy_assignment/utilities/router_constants.dart';
 class SplashScreen extends StatefulWidget {
   const SplashScreen({Key? key}) : super(key: key);

   @override
   _SplashScreenState createState() => _SplashScreenState();
 }

 class _SplashScreenState extends State<SplashScreen> {
   NavigationService _navigationService = locator<NavigationService>();
   @override
   void initState() {
     super.initState();

     Timer(Duration(seconds: 2),
             ()=>
             _navigationService.navigateWithRemovingAllPrevious(DASHBOARD_SCREEN)
     );
   }
   @override
   Widget build(BuildContext context) {
     ClassMediaQuery(context);
     return Scaffold(
       backgroundColor: Colors.blue[400],
       body: Container(
         child: Center(
           child: Image.asset(
             ImageConstants.splashScreenImg,
             height: 150,
             width: 150,
           ),
         ),
       ),
     );
   }
 }



