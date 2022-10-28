import 'package:flutter/material.dart';

import '../../dashboard/presentation/screens/dashboardScreen.dart';

class SplashController {
  void navigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
    });
  }
}
