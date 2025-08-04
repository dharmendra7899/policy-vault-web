

import 'package:flutter/material.dart';
import 'package:policy_vault_web/theme/colors.dart';

class RolesAndResponsibilitiesSection extends StatelessWidget {
  const RolesAndResponsibilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle headerStyle = Theme.of(context).textTheme.headlineMedium!.copyWith(
      color: appColors.secondary,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    final TextStyle cellStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
      height: 1.4,
      color: appColors.secondary,
      fontWeight: FontWeight.w500,
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 800),
        child: Table(
          border: TableBorder.all(color: appColors.borderColor.withValues(alpha: 0.7), width: 1),
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          columnWidths: const {
            0: FixedColumnWidth(400),
            1: FixedColumnWidth(900),
          },
          children: [
            _buildRow('Roles', 'Responsibilities', headerStyle, isHeader: true),
            _buildRow(
              'Board of Directors and Senior Management\n(Managing Partner and Partners)',
              '• Overall responsibility for ensuring that Policy Vault complies with its legal obligations for data privacy.',
              cellStyle,
            ),
            _buildRow(
              'Information Security Group / Committee / CISO',
              '• Briefing the board on data protection responsibilities.\n'
                  '• Reviewing data protection and related policies.\n'
                  '• Advising other staff on data protection issues.\n'
                  '• Ensuring periodic security induction and training.\n'
                  '• Handling subject access requests.\n'
                  '• Approving unusual disclosures.\n'
                  '• Approving contracts with processors.',
              cellStyle,
            ),
            _buildRow(
              'Department Head',
              '• Responsible for establishing data protection practices.\n'
                  '• Ensure Information Security Group is informed of data use changes.',
              cellStyle,
            ),
            _buildRow(
              'Staff / Team',
              '• Must read, understand, and follow personal data policies.',
              cellStyle,
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildRow(String col1, String col2, TextStyle style, {bool isHeader = false}) {
    return TableRow(
      decoration: isHeader
          ? BoxDecoration(color: appColors.borderColor.withValues(alpha: 0.7))
          : null,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(col1, style: style),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(col2, style: style),
        ),
      ],
    );
  }
}
