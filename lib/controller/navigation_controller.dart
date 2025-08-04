import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final scrollController = ScrollController();
  final currentSection = 'home'.obs;

  RxBool showPrivacy = false.obs;
  RxBool showTerms = false.obs;

  final hoveredItem = ''.obs;
  final sectionKeys = {
    'home': GlobalKey(),
    'feature': GlobalKey(),
    'quick': GlobalKey(),
    'about': GlobalKey(),
    'download': GlobalKey(),
    'contact': GlobalKey(),
    'terms': GlobalKey(),
    'policy': GlobalKey(),
  };

  void setHovered(String section) => hoveredItem.value = section;

  void clearHovered() => hoveredItem.value = '';

  final Map<String, RxBool> animateSection = {
    'home': false.obs,
    'feature': false.obs,
    'quick': false.obs,
    'about': false.obs,
    'contact': false.obs,
    'download': false.obs,
    'policy': false.obs,
    'terms': false.obs,
  };


  void scrollTo(String section) {
    final context = sectionKeys[section]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      animateSection[section]?.value = false;
      Future.delayed(const Duration(milliseconds: 100), () {
        animateSection[section]?.value = true;
      });

      currentSection.value = section;
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
