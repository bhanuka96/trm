import 'package:flutter/material.dart';
import 'package:trm/features/dashboard/presentation/screens/dashboardScreen.dart';

import '../features/common/presentation/screens/splashScreen.dart';

class AppRoutes {
  static const initial = SplashScreen.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case DashboardScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
