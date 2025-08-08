import 'package:flutter/material.dart';
import 'package:policy_vault_web/views/about_section.dart';
import 'package:policy_vault_web/views/banner_section.dart';
import 'package:policy_vault_web/views/contact_section.dart';
import 'package:policy_vault_web/views/download_section.dart';
import 'package:policy_vault_web/views/feature_section.dart';
import 'package:policy_vault_web/views/policy_section.dart';
import 'package:policy_vault_web/views/quick_section.dart';
import 'package:policy_vault_web/views/term_section.dart';
import 'package:get/get.dart';
import 'package:policy_vault_web/controller/navigation_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

/*class SectionWidget extends StatelessWidget {
  final String title;
  final Key keyValue;
  final Color color;

  const SectionWidget({
    super.key,
    required this.title,
    required this.keyValue,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: keyValue,
      height: title == "Policy"||title == "Quick"||title == "Term"?null:MediaQuery.of(context).size.height - 50,
      width: double.infinity,
      color: color,
      alignment: Alignment.center,
      child: title == "Home"
          ? BannerSection()
          : title == "Feature"
          ? FeatureSection()
          : title == "Quick"
          ? QuickSection()
          : title == "About"
          ? AboutSection()
          : title == "Contact"
          ? ContactUsSection()
          : title == "Policy"
          ? PolicySection()
          : title == "Term"
          ? TermSection()
          : DownloadSection(),
    );
  }
}*/

class SectionWidget extends StatelessWidget {
  final String title;
  final Key keyValue;
  final Color color;

  const SectionWidget({
    super.key,
    required this.title,
    required this.keyValue,
    required this.color,
  });

  Widget _buildContent(String title) {
    switch (title) {
      case "Home":
        return const BannerSection();
      case "Feature":
        return const FeatureSection();
      case "Quick":
        return const QuickSection();
      case "About":
        return const AboutSection();
      case "Contact":
        return const ContactUsSection();
      case "Policy":
        return const PolicySection();
      case "Term":
        return const TermSection();
      case "Download":
      default:
        return const DownloadSection();
    }
  }

  @override
  Widget build(BuildContext context) {
    final NavigationController nav = Get.find<NavigationController>();

    return VisibilityDetector(
      key: keyValue,
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) {
          nav.setCurrentSection(title.toLowerCase());
        }
      },
      child: Container(
        height: (title == "Policy" || title == "Quick" || title == "Term")
            ? null
            : MediaQuery.of(context).size.height - 50,
        width: double.infinity,
        color: color,
        alignment: Alignment.center,
        child: _buildContent(title),
      ),
    );
  }
}
