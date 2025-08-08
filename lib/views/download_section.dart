import 'package:flutter/material.dart';
import 'package:policy_vault_web/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadSection extends StatelessWidget {
  const DownloadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/about.jpg"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: _buildContent(context, isMobile),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildContent(context, isMobile),
                ),
        );
      },
    );
  }

  List<Widget> _buildContent(BuildContext context, bool isMobile) {
    return [
      Expanded(
        flex: isMobile ? 0 : 2,
        child: Padding(
          padding: EdgeInsets.only(right: isMobile ? 16.0 : 558.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: isMobile ? 56 : 16),
              Text(
                "Get Our App!",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: isMobile ? 30 : 50,
                  fontWeight: FontWeight.bold,
                  color: appColors.appWhite,
                ),
              ),
              const SizedBox(height: 36),
              Text(
                "Going Live Soon!",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile ? 16 : 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildStoreButton(
                    context,
                    imagePath: "assets/images/apple.png",
                    title: "App Store",
                    subtitle: "Download on the",
                    onTap: () => launchUrl(
                      Uri.parse(
                        "https://apps.apple.com/gb/app/policy-vault/id6504247564",
                      ),
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : 26, height: isMobile ? 36 : 0),
                  _buildStoreButton(
                    context,
                    imagePath: "assets/images/play.png",
                    title: "Play Store",
                    subtitle: "Download on the",
                    onTap: () => launchUrl(
                      Uri.parse(
                        "https://play.google.com/store/apps/details?id=com.proj.policyvault&pcampaignid=web_share&pli=1",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ];
  }

  Widget _buildStoreButton(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String subtitle,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: appColors.appWhite,
          boxShadow: [
            BoxShadow(
              color: appColors.borderColor.withValues(alpha: 0.6),
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 1),
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, height: 40, width: 40),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 12,
                    color: appColors.secondary,
                  ),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                    color: appColors.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
