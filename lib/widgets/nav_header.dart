import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policy_vault_web/controller/navigation_controller.dart';
import 'package:policy_vault_web/theme/colors.dart';

class NavHeader extends StatelessWidget implements PreferredSizeWidget {
  final navigationController = Get.find<NavigationController>();

  NavHeader({super.key, required this.context});

  final BuildContext context;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  Widget buildNavButton(String title, String section) {
    return Obx(() {
      final isHovered = navigationController.hoveredItem.value == section;
      final isActive = navigationController.currentSection.value == section;
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => navigationController.setHovered(section),
        onExit: (_) => navigationController.clearHovered(),
        child: GestureDetector(
          onTap: () {
            navigationController.scrollTo(section);
            navigationController.showPrivacy.value = false;
            navigationController.showTerms.value = false;
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              title,
              style: TextTheme.of(context).titleLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: isActive
                    ? appColors.headingColor
                    : isHovered
                    ? appColors.headingColor
                    : appColors.appWhite,
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return AppBar(
      backgroundColor: appColors.primary,
      titleSpacing: 20,
      title: Text(
        "Policy Vault",
        style: TextTheme.of(context).titleLarge?.copyWith(
          fontSize: isMobile ? 20 : 30,
          fontWeight: FontWeight.w700,
          color: appColors.appWhite,
        ),
      ),
      actions: isMobile
          ? null
          : [
              buildNavButton('Home', 'home'),
              buildNavButton('Feature', 'feature'),
              buildNavButton('Download', 'download'),
              buildNavButton('About', 'about'),
              buildNavButton('Contact', 'contact'),
              const SizedBox(width: 16),
            ],
      leading: isMobile
          ? Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu, color: appColors.appWhite),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            )
          : null,
    );
  }
}
