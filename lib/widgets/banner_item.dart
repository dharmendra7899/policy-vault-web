import 'package:flutter/material.dart';
import 'package:policy_vault_web/theme/colors.dart';

class BannerItem extends StatelessWidget {
  final String title;
  final String description;
  final String slug;
  final String image;

  const BannerItem({
    super.key,
    required this.title,
    required this.description,
    required this.slug,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;


    return Container(
      margin: EdgeInsets.only(top: isMobile ? 10 : 50),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
      color: appColors.primary,
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: isMobile
            ? MainAxisAlignment.spaceEvenly
            :MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: isMobile ? 0 : 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (title.isNotEmpty)
                  Text(
                    title.toUpperCase(),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    style: TextTheme.of(context).titleLarge?.copyWith(
                      fontSize: isMobile ? 18 : 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),

                Text(
                  description.toUpperCase(),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  style: TextTheme.of(context).headlineLarge?.copyWith(
                    fontSize: isMobile ? 16 : 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (slug.isNotEmpty)
                  Text(
                    slug.toUpperCase(),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    style: TextTheme.of(context).titleLarge?.copyWith(
                      fontSize: isMobile ? 16 : 34,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                  ),
              ],
            ),
          ),

          // IMAGE SECTION
          Expanded(
            flex: isMobile ? 0 : 4,
            child: Padding(
              padding: EdgeInsets.only(top: isMobile ? 20 : 0),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                scale: isMobile ?  1.4 : 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
