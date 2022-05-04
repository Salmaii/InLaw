import 'package:InLaw/src/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:InLaw/src/theme.dart';
import '../../viewmodel/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeViewModel> {
  late ThemeData _theme;

  Widget get _pageName => Container(
    width: double.infinity,
    height: 60,
    child: Text(
      'Home'.i18n(),
      style: kTitleBlack,
      textAlign: TextAlign.center,
    ),
  );

  Widget get _categoryBlock => Container(
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 20),
        width: 60,
        height: 60,
        color: AppColors.secondary, // TODO Change Color Create _categoryButton Color theme in theme.dart
        child: TextButton(
          style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
          onPressed: store.isLoading ? null : () {
            Modular.to.pushNamed('/home/userId');
          },
          child: Text('Civil'.i18n()), // TODO Category Names
        ),
      );

    Widget get _categoryContainer => GridView.count( // TODO Fix GridView
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        _categoryBlock,
        _categoryBlock,
        _categoryBlock,
        _categoryBlock,
        _categoryBlock,
        _categoryBlock,
      ],
    );

  Widget get _formBuild => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 5),
                  _pageName,
                  _categoryBlock,
                  _categoryBlock,
                  _categoryBlock,
                  _categoryBlock,
                  //_categoryContainer,
                ],
              );

  @override
    Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('InLaw')),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*0.88,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
              ),

              child: Observer(builder: (_) {
                return Form(child: _formBuild);
              }),
            )
          ),
        ),
      ),
    );
  }
}