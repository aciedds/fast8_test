import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  var showButton = false.obs;
  final imgLocation = "assets/svg/";
  
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/svg/onboarding1.svg",
      "title": "Welcome",
      "description": "Welcome to our amazing app!"
    },
    {
      "image": "assets/svg/onboarding2.svg",
      "title": "Features",
      "description": "Discover the awesome features we offer."
    },
    {
      "image": "assets/svg/onboarding3.svg",
      "title": "Get Started",
      "description": "Let's get started and explore!"
    },
  ];

  void changePage(int index) {
    currentIndex.value = index;
    showButton.value = false;

    if (index == 2) {
      Future.delayed(Duration(seconds: 1), () {
        showButton.value = true;
      });
    }
  }
}
