import 'package:flutter/material.dart';
import 'package:policy_vault_web/theme/colors.dart';

class QuickSection extends StatelessWidget {
  const QuickSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "QUICK, EASY, SAFE",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: isMobile ? 30 : 50,
              fontWeight: FontWeight.bold,
              color: appColors.appWhite,
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 600;

              if (isMobile) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildColumnLayout(context),
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildRowLayout(context),
                );
              }
            },
          ),

          //  _phoneImage()
        ],
      ),
    );
  }

  List<Widget> _buildColumnLayout(BuildContext context) {
    return [
      _leftColumn(context),
      const SizedBox(height: 20),
      _phoneImage(),
      const SizedBox(height: 20),
      _rightColumn(context),
    ];
  }

  List<Widget> _buildRowLayout(BuildContext context) {
    return [_leftColumn(context), _phoneImage(), _rightColumn(context)];
  }

  Widget _leftColumn(BuildContext context) {
    return Column(
      children: [
        _featureBox(
          color: Color(0xff94E75E),
          icon: Icons.edit_document,
          title: "REGISTER & ADD POLICY",
          context: context,
        ),
        const SizedBox(height: 20),
        _featureBox(
          color: Color(0xff48F9D5),
          icon: Icons.group,
          title: "INVITE FAMILY and Share Policies,",
          context: context,
        ),
      ],
    );
  }

  Widget _rightColumn(BuildContext context) {
    return Column(
      children: [
        _featureBox(
          color: Color(0xff88FFFF),
          icon: Icons.loop,
          title: "Compare, Buy and Renew,",
          context: context,
        ),
        const SizedBox(height: 20),
        _featureBox(
          color: Color(0xffE2FD21),
          icon: Icons.description,
          title: "Make a claim",
          context: context,
        ),
      ],
    );
  }

  Widget _featureBox({
    required Color color,
    required IconData icon,
    required String title,
    required BuildContext context,
  }) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all()),
            child: Icon(icon, size: 40),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextTheme.of(context).bodyLarge?.copyWith(
                color: appColors.secondary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _phoneImage() {
    return Image.asset("assets/images/download.png", scale: 5);
  }
}
