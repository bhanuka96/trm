import 'package:flutter/material.dart';
import 'package:trm/features/dashboard/presentation/screens/dashboardScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, DashboardScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
