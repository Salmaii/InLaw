import 'package:flutter/material.dart';

class Onboarding {
  final String image;
  //final String text;

  Onboarding({
    required this.image,
    //required this.text
  });
}

List<Onboarding> onboardingContents = [
  Onboarding(
    image: 'lib/assets/images/onboarding1.png',
    //text: Text('Onboard_text1'.i18n());
  ),
  Onboarding(
    image: 'lib/assets/images/onboarding1.png',
  ),
  Onboarding(
    image: 'lib/assets/images/onboarding2.png',
  ),
];
