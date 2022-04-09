import 'package:flutter/material.dart';

class Onboarding {
  final String image;
  final String title;

  Onboarding({required this.image, required this.title});
}

List<Onboarding> onboardingContents = [
  Onboarding(image: 'lib/assets/images/law_court.gif', title: 'Onboard_text1'),
  Onboarding(
    image: 'lib/assets/images/onboarding1.png',
    title: 'Onboard_text2',
  ),
  Onboarding(
    image: 'lib/assets/images/onboarding2.png',
    title: 'Onboard_text3',
  ),
];


//Para ajudar os Advogados que estão em busca do melhor caso e para ajudar os clientes que estão em busca de um advogado.