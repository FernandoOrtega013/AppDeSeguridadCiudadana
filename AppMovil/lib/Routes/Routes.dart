import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled2/UI/DashBoard/Alert/Alert.dart';
import 'package:untitled2/UI/DashBoard/Dashboard.dart';
import 'package:untitled2/UI/DashBoard/Profile/Profile.dart';
import 'package:untitled2/UI/Login/Login.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/Login':
      return PageTransition(child: const Login(), type: PageTransitionType.leftToRight);
    case '/Dashboard':
      return PageTransition(child: const DashBoard(), type: PageTransitionType.rightToLeft);
    case '/Profile':
      return PageTransition(child: const Profile(), type: PageTransitionType.rightToLeft);
    case '/Alert':
      return PageTransition(child: const Alert(), type: PageTransitionType.rightToLeft);
    default:
      return MaterialPageRoute(
        builder: (_) => Container(),
      );
  }
}