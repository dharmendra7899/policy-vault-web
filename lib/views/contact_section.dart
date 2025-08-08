import 'package:flutter/material.dart';
import 'package:policy_vault_web/theme/colors.dart';


class ContactUsSection extends StatelessWidget {
  const ContactUsSection({super.key});

  bool isMobileLayout(BoxConstraints constraints) => constraints.maxWidth < 600;

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = isMobileLayout(constraints);

        Widget layout = isMobile
            ? Column(
          key: const ValueKey('column'),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildChildren(context, isMobile),
        )
            : Row(
          key: const ValueKey('row'),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildChildren(context, isMobile),
        );

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: layout,
        );
      },
    );
  }

  List<Widget> _buildChildren(BuildContext context, bool isMobile) {
    final content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: isMobile ?30:50,
            color: appColors.appWhite,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 38.0),
          child: SelectableText(
            '1800 8900 113',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: isMobile ?30:50,
              color: appColors.headingColor,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),
      ],
    );

    final image = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        'assets/images/contact.png',
        scale:  isMobile ?1.5:1.1,
      ),
    );

    return isMobile ? [image, content] : [content, image];
  }
}

