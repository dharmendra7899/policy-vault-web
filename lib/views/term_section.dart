import 'package:flutter/material.dart';
import 'package:policy_vault_web/theme/colors.dart';

class TermSection extends StatelessWidget {
  const TermSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    return Padding(
      padding:  EdgeInsets.all(isMobile?20:100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Terms and Conditions',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: isMobile ? 30 : 50,
              color: appColors.secondary,
              decoration: TextDecoration.underline,
              decorationColor: appColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
