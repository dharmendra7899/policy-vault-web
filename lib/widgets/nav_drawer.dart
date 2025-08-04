// lib/widgets/nav_drawer.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policy_vault_web/controller/navigation_controller.dart';
import 'package:policy_vault_web/theme/colors.dart';

class NavDrawer extends StatelessWidget {
  final navigationController = Get.find<NavigationController>();

  NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.80,
      backgroundColor: appColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                drawerItem('Home', 'home', context),
                drawerItem('Feature', 'feature', context),
                drawerItem('About', 'about', context),
                drawerItem('Download', 'download', context),
                drawerItem('Contact', 'contact', context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(String title, String section, BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigationController.scrollTo(section);
        navigationController.showPrivacy.value = false;
        navigationController.showTerms.value = false;
        Navigator.of(Get.context!).pop();
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          title,
          style: TextTheme.of(context).titleLarge?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: appColors.appWhite,
          ),
        ),
      ),
    );
  }
}
