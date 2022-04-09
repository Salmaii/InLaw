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
    //text: 'Para ajudar os Advogados que estão em busca do melhor caso  e para'
  ),
  Onboarding(
    image: 'lib/assets/images/onboarding1.png',
  ),
  Onboarding(
    image: 'lib/assets/images/onboarding2.png',
  ),
];
