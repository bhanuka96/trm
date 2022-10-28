import 'package:flutter/material.dart';
import 'package:trm/config/appColors.dart';

import '../../widgets/itemListCard.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/dashboardScreen';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Image.asset('assets/logo/logo.png', width: 50, height: 50),
      ),
      body: ListView.builder(
        // itemCount: 10,
        padding: const EdgeInsets.all(12),
        itemBuilder: (_, int index) {
          return const ListItemWidget();
        },
      ),
    );
  }
}
