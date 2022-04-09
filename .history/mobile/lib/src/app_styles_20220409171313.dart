import 'package:flutter/material.dart';
import './size_configs.dart';

Color kPrimaryColor = Color(0xffFC9803);
Color kSecondaryColor = Color(0xffFFFFFF);

final kTitle = TextStyle(
  fontFamily: 'Klasik',
  fontSize: SizeConfig.blockSizeH! * 1, //7
  color: kSecondaryColor,
);

final kBodyText1 = TextStyle(
  color: kSecondaryColor,
  fontSize: SizeConfig.blockSizeH! * 1, //4.5
  fontWeight: FontWeight.bold,
);
