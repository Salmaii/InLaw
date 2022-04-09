import 'package:InLaw/src/app_styles.dart';
import 'package:InLaw/src/features/auth/domain/model/onboard_data.dart';
import 'package:InLaw/src/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:InLaw/src/features/auth/auth_module.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;

  PageController _pageController = PageController();

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Color(0xFF011C2E),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    Text(
                      'Bem-Vindo ao\naplicativo InLaw.'.i18n(),
                      style: kTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    Container(
                      height: sizeV * 30,
                      child: Image.asset(
                        onboardingContents[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    _Text,
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    _OnboardingTaskB,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _Text => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(style: kBodyText1, children: [
          TextSpan(text: 'Para'),
          TextSpan(
            text: ' ajudar os Advogados',
            style: TextStyle(color: kPrimaryColor),
          ),
          TextSpan(text: ' que estão em busca do'),
          TextSpan(
            text: ' melhor caso',
            style: TextStyle(color: kPrimaryColor),
          ),
          TextSpan(text: ' e para'),
          TextSpan(
            text: ' ajudar o cliente',
            style: TextStyle(color: kPrimaryColor),
          ),
          TextSpan(text: ' que estão em busca de um'),
          TextSpan(
            text: ' advogado.',
            style: TextStyle(color: kPrimaryColor),
          ),
        ]),
      );

  Widget get _OnboardingTaskB => Expanded(
        flex: 1,
        child: Column(
          children: [
            currentPage == onboardingContents.length - 1
                ? MyTextButton(
                    buttonName: 'Get Started'.i18n(),
                    onpressed: () {
                      Modular.to.pushNamed('/login');
                    },
                    btColor: kPrimaryColor,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OnboardingButton(
                        name: 'Pular'.i18n(),
                        onPressed: () {},
                      ),
                      Row(
                        children: List.generate(onboardingContents.length,
                            (index) => dotIndicator(index)),
                      ),
                      OnboardingButton(
                        name: 'Proximo'.i18n(),
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ],
                  ),
          ],
        ),
      );
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onpressed,
    required this.btColor,
  }) : super(key: key);
  final String buttonName;
  final VoidCallback onpressed;
  final Color btColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: SizeConfig.blockSizeH! * 10,
        width: SizeConfig.blockSizeH! * 100,
        child: TextButton(
          onPressed: onpressed,
          child: Text(
            buttonName,
            style: kBodyText1,
          ),
          style: TextButton.styleFrom(
            backgroundColor: btColor,
          ),
        ),
      ),
    );
  }
}

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          name,
          style: kBodyText1,
        ),
      ),
    );
  }
}
