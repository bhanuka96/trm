import 'package:flutter/material.dart';
import 'package:trm/config/appColors.dart';

import '../../application/splashController.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashController {

  @override
  void initState() {
    super.initState();
    navigate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: Image.asset('assets/logo/logo.png', width: 50, height: 50)),
    );
  }
}
