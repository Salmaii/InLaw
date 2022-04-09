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
          'Para ajudar os Advogados que estão em busca do melhor caso e para ajudar os clientes que estão em busca de um advogado.'),
  Onboarding(
    image: 'lib/assets/images/onboarding1.png',
    title: 'blablabla',
  ),
  Onboarding(
    image: 'lib/assets/images/onboarding2.png',
    title: 'Teste',
  ),
];
