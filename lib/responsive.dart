import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
    required this.desktop,
    this.tablet,
    this.largeMobile,
    this.extraLargeScreen,
  });

  final Widget mobile;
  final Widget desktop;
  final Widget? tablet;
  final Widget? largeMobile;
  final Widget? extraLargeScreen;

  static bool isExtraLargeScreen(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1400;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1024;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 600 && MediaQuery.sizeOf(context).width < 1024;

  static bool isLargeMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 500 && MediaQuery.sizeOf(context).width < 600;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 500;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= 1400 && extraLargeScreen != null) {
      return extraLargeScreen!;
    } else if (width >= 1024) {
      return desktop;
    } else if (width >= 600 && tablet != null) {
      return tablet!;
    } else if (width >= 500 && largeMobile != null) {
      return largeMobile!;
    } else {
      return mobile;
    }
  }
}
