import 'package:flutter/material.dart';
import 'package:policy_vault_web/theme/colors.dart';

class DottedBullet extends StatelessWidget {
  final String text;

  const DottedBullet({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              height: 1.4,
              color: appColors.secondary,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                height: 1.4,
                fontWeight: FontWeight.w500,
                color: appColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
