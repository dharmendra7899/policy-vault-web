import 'package:flutter/material.dart';
import 'package:policy_vault_web/theme/colors.dart';
import 'dart:async';

import 'package:policy_vault_web/widgets/banner_item.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _autoScrollTimer;

  final bannerList = [
    {
      "title": "Access Your",
      "description": "Insurance Policies",
      "slug": "In just a click!",
      "image": "assets/images/banner.png",
    },
    {
      "title": "Share your Policies with",
      "description": "Your Family",
      "slug": "",
      "image": "assets/images/banner.png",
    },
    {
      "title": "Save upto 40% when you",
      "description": "Compare buy & renew",
      "slug": "",
      "image": "assets/images/banner.png",
    },
    {
      "title": "",
      "description": "Make a claim",
      "slug": "from anywhere, anytime1",
      "image": "assets/images/banner.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 6), (timer) {
      final nextPage = (_currentIndex + 1) % bannerList.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 2000),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.80,
          child: PageView.builder(
            controller: _pageController,
            itemCount: bannerList.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (_, index) {
              final item = bannerList[index];
              return BannerItem(
                title: item['title']!,
                description: item['description']!,
                slug: item['slug']!,
                image: item['image']!,
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(bannerList.length, (index) {
        final isActive = _currentIndex == index;

        return GestureDetector(
          onTap: () {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: isMobile ? 18 : 25,
            height: isMobile ? 10 : 15,
            decoration: BoxDecoration(
              color: isActive ? appColors.buttonColor : appColors.headingColor,
              borderRadius: BorderRadius.circular(isMobile ? 4 : 8),
            ),
          ),
        );
      }),
    );
  }
}
