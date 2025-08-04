import 'package:flutter/material.dart';
import 'package:policy_vault_web/views/about_section.dart';
import 'package:policy_vault_web/views/banner_section.dart';
import 'package:policy_vault_web/views/contact_section.dart';
import 'package:policy_vault_web/views/download_section.dart';
import 'package:policy_vault_web/views/feature_section.dart';
import 'package:policy_vault_web/views/policy_section.dart';
import 'package:policy_vault_web/views/quick_section.dart';
import 'package:policy_vault_web/views/term_section.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      key: keyValue,
      height: title == "Policy"||title == "Quick"?null:MediaQuery.of(context).size.height - 50,
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
}
