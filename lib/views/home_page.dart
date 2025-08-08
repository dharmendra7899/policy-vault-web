import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policy_vault_web/controller/navigation_controller.dart';
import 'package:policy_vault_web/responsive.dart';
import 'package:policy_vault_web/theme/colors.dart';
import 'package:policy_vault_web/widgets/nav_drawer.dart';
import 'package:policy_vault_web/widgets/nav_header.dart';
import 'package:policy_vault_web/widgets/section_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NavigationController nav = Get.put(NavigationController());

  @override
  void dispose() {
    nav.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.primary,
      appBar: NavHeader(context: context),
      drawer: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? NavDrawer()
          : null,
      body: Responsive(
        mobile: _buildContent(context),
        largeMobile: _buildContent(context),
        tablet: _buildContent(context),
        desktop: _buildContent(context),
        extraLargeScreen: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      controller: nav.scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SectionWidget(
            title: 'Home',
            keyValue: nav.sectionKeys['home']!,
            color: appColors.primary,
          ),
          SectionWidget(
            title: 'Feature',
            keyValue: nav.sectionKeys['feature']!,
            color: appColors.featureColor,
          ),

          SectionWidget(
            title: 'Quick',
            keyValue: nav.sectionKeys['quick']!,
            color: appColors.primaryDark,
          ),
          SectionWidget(
            title: 'Download',
            keyValue: nav.sectionKeys['download']!,
            color: appColors.secondary,
          ),
          SectionWidget(
            title: 'Contact',
            keyValue: nav.sectionKeys['contact']!,
            color: appColors.contactColor,
          ),
          Obx(() {
            final policyKey = nav.sectionKeys['policy'];
            final termsKey = nav.sectionKeys['terms'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (nav.showPrivacy.value && policyKey != null)
                  SectionWidget(
                    title: 'Policy',
                    color: appColors.policyColor,
                    keyValue: policyKey,
                  ),
                if (nav.showTerms.value && termsKey != null)
                  SectionWidget(
                    title: 'Term',
                    color: appColors.termColor,
                    keyValue: termsKey,
                  ),
              ],
            );
          }),
          SectionWidget(
            title: 'About',
            keyValue: nav.sectionKeys['about']!,
            color: appColors.primaryDark,
          ),
        ],
      ),
    );
  }
}
