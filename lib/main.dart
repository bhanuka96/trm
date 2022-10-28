import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trm/config/appLayout.dart';
import 'package:trm/config/appStrings.dart';
import 'package:trm/config/theme.dart';

import 'config/http/httpClientCertificate.dart';
import 'config/routers.dart';

void main() {
  /// Create Http Client
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: AppTheme(Brightness.light).themeData,
      darkTheme: AppTheme(Brightness.dark).themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      onGenerateRoute: AppRoutes.generateRoute,
      builder: (context, child) => MediaQuery(data: AppLayout.appScaleFactor(context), child: child!),
    );
  }
}
