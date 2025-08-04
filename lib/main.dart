import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policy_vault_web/theme/theme.dart';
import 'package:policy_vault_web/views/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      themeMode: ThemeMode.light,
      theme: AppTheme.lightThemeMode,
      darkTheme: AppTheme.darkThemeMode,
      locale: Locale('en'),
      debugShowCheckedModeBanner: false,
      title: 'Policy Vault',
      home: HomePage(),
    );
  }
}
