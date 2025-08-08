import 'package:flutter/material.dart';
import 'package:policy_vault_web/model/feature_model.dart';
import 'package:policy_vault_web/theme/colors.dart';

class FeatureSection extends StatefulWidget {
  const FeatureSection({super.key});

  @override
  State<FeatureSection> createState() => _FeatureSectionState();
}

class _FeatureSectionState extends State<FeatureSection> {
  final List<FeatureItemModel> features = [
    FeatureItemModel(
      iconPath: 'assets/images/notes.png',
      title: 'Register',
      bullets: [
        'Register your claim from anywhere, anytime.',
        'Emergency Assistance in case of accident',
        'Expert end-to-end claim support',
      ],
    ),
    FeatureItemModel(
      iconPath: 'assets/images/follower.png',
      title: 'Share',
      bullets: [
        'Invite and Add Family members',
        'Share your policies to individuals',
        'Family members can access your shared policies',
      ],
    ),
    FeatureItemModel(
      iconPath: 'assets/images/renew.png',
      title: 'Buy/Renew',
      bullets: [
        'Compare 35+ Insurance Companies',
        'Buy & Save up to 40% on insurance premium',
        'Keep track of your policy renewals',
      ],
    ),
    FeatureItemModel(
      iconPath: 'assets/images/claim.png',
      title: 'Claim',
      bullets: [
        'Register your claim from anywhere, anytime.',
        'Emergency Assistance in case of accident',
        'Expert end-to-end claim support',
      ],
    ),
  ];

  late List<bool> _hoverStates;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _hoverStates = List.filled(features.length, false);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Policy Vault - the new-age\ninsurance wallet',
            textAlign: TextAlign.center,
            style: TextTheme.of(context).headlineLarge?.copyWith(
              color: appColors.secondary,
              fontSize: isMobile ? 24 : 56,
            ),
          ),
         // SizedBox(height: isMobile ? 40 : 80),

          isMobile
              ? SizedBox(
                  height: 270,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: features.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (_, index) => _buildCard(
                      features[index],
                      width * 0.8,
                      index,
                      context,
                    ),
                  ),
                )
              : Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: false,
                  trackVisibility: false,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        features.length,
                        (i) => Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: _buildCard(features[i], 280, i, context),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildCard(
    FeatureItemModel feature,
    double width,
    int index,
    BuildContext context,
  ) {
    final isHovering = _hoverStates[index];
    return MouseRegion(
      onEnter: (_) => setState(() => _hoverStates[index] = true),
      onExit: (_) => setState(() => _hoverStates[index] = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        width: width,
        height: 270,
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        decoration: BoxDecoration(
          color: appColors.appWhite,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: isHovering
                  ? Colors.indigo.withValues(alpha: 0.7)
                  : Colors.grey.withValues(alpha: 0.08),
              blurRadius: isHovering ? 12 : 3,
              // offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(feature.iconPath, width: 40, height: 40),
                const SizedBox(width: 8),
                Text(
                  feature.title,
                  style: TextTheme.of(
                    context,
                  ).titleLarge?.copyWith(color: appColors.secondary),
                ),
              ],
            ),

            const SizedBox(height: 12),
            ...feature.bullets.map(
              (text) => Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ',
                      style: TextTheme.of(
                        context,
                      ).titleLarge?.copyWith(color: appColors.secondary),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          text,
                          style: TextTheme.of(context).bodyLarge?.copyWith(
                            color: appColors.secondary,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
