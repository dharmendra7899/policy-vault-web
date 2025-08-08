import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policy_vault_web/controller/navigation_controller.dart';
import 'package:policy_vault_web/theme/colors.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  final NavigationController nav = Get.find();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final screenHeight = MediaQuery.of(context).size.height-50;
    return Obx(() {
      if (nav.animateSection['about']?.value == true) {
        _controller.forward(from: 0);
      }

      return VisibilityDetector(
        key: const Key("about-visibility"),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.3) {
            if (!nav.animateSection['about']!.value) {
              _controller.forward(from: 0);
              nav.animateSection['about']!.value = true;
            }
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: screenHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  color: appColors.aboutColor,
                  padding: EdgeInsets.all(isMobile ? 20 : 140),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        children: [
                          Text(
                            "Policy Vault",
                            style: TextTheme.of(context).headlineLarge?.copyWith(
                              color: appColors.appWhite,
                              fontSize: 40,
                              height: 1.8,
                              decorationThickness: 1,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationColor: appColors.appWhite,
                            ),
                          ),
                          SizedBox(height: 60),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 0 : 160,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Useful Links",
                                        style: TextTheme.of(context).bodyLarge
                                            ?.copyWith(
                                              color: appColors.appWhite,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      const SizedBox(height: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:
                                            [
                                              "Privacy Policy",
                                              "Terms and Conditions",
                                              "Contact",
                                            ].map((link) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 2.0,
                                                    ),
                                                child: _HoverableLink(
                                                  text: link,
                                                  onTap: () {
                                                    setState(() {
                                                      if (link ==
                                                          "Privacy Policy") {
                                                        nav.showPrivacy.value =
                                                            true;
                                                        nav.showTerms.value =
                                                            false;
                                                      }
                                                      if (link ==
                                                          "Terms and Conditions") {
                                                        nav.showTerms.value =
                                                            true;
                                                        nav.showPrivacy.value =
                                                            false;
                                                      }
                                                      if (link == "Contact") {
                                                        nav.showTerms.value =
                                                            false;
                                                        nav.showPrivacy.value =
                                                            false;
                                                      }
                                                    });

                                                    final key = linkKey(link);
                                                    final keyContext = nav
                                                        .sectionKeys[key]
                                                        ?.currentContext;
                                                    if (keyContext != null) {
                                                      Scrollable.ensureVisible(
                                                        keyContext,
                                                        duration: const Duration(
                                                          milliseconds: 500,
                                                        ),
                                                        curve: Curves.easeInOut,
                                                      );
                                                    }
                                                  },
                                                ),
                                              );
                                            }).toList(),
                                      ),
                                    ],
                                  ),
                                ),

                                // About Us
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "About Us",
                                        style: TextTheme.of(context).bodyLarge
                                            ?.copyWith(
                                              color: appColors.appWhite,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        "PolicyVault is a revolutionary Family Insurance Wallet designed to simplify the management and claims of any Insurance Policy. It is developed in India by Keewee Fintech ensuring it meets the evolving need of Insurance customers.",
                                        style: TextTheme.of(context).labelLarge
                                            ?.copyWith(
                                              color: appColors.appWhite,
                                              fontWeight: FontWeight.w500,
                                              height: 1.4,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 22 : 38.0,
                    vertical: isMobile ? 14 : 40,
                  ),
                  child: Text(
                    '''Keewee Fintech Private Limited Recognized by #StartupIndia CERTIFICATE NO: DIPP153964 (VALID UPTO 19-10-2032) CIN: U72500UP2022PTC172513, \nRegistered Address- 12A Station Road LKO, Lucknow, Uttar Pradesh, India, 226001
            \n© 2025 All Rights Reserved. Design by e-profit booster''',
                    textAlign: TextAlign.center,
                    style: TextTheme.of(context).titleLarge?.copyWith(
                      color: appColors.appWhite,
                      fontSize: isMobile ? 12 : 14,
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

    });
  }

  String linkKey(String link) {
    switch (link) {
      case "Privacy Policy":
        return "policy";
      case "Terms and Conditions":
        return "terms";
      case "Contact":
        return "contact";
      default:
        return "";
    }
  }
}

class _HoverableLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _HoverableLink({required this.text, required this.onTap});

  @override
  State<_HoverableLink> createState() => _HoverableLinkState();
}

class _HoverableLinkState extends State<_HoverableLink> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final color = _isHovering ? appColors.hoverColor : appColors.appWhite;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: color,
            fontWeight: FontWeight.w500,
            decoration: _isHovering
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
