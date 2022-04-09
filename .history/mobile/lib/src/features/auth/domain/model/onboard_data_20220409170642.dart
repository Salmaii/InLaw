import 'package:flutter/material.dart';

class Onboarding {
  final String image;
  final String title;

  Onboarding({required this.image, required this.title});
}

List<Onboarding> onboardingContents = [
  Onboarding(
      image: 'lib/assets/images/onboarding1.png',
      title:
          'Para  que estão em busca do e para ajudar os clientes que estão em busca de um advogado.'),
  Onboarding(
    image: 'lib/assets/images/onboarding1.png',
    title: 'blablabla',
  ),
  Onboarding(
    image: 'lib/assets/images/onboarding2.png',
    title: 'Teste',
  ),
];
