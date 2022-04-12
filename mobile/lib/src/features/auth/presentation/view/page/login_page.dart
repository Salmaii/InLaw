import 'package:InLaw/src/common/form_text_field.dart';
import 'package:InLaw/src/features/auth/presentation/view/page/signup_page.dart';
import 'package:InLaw/src/features/auth/presentation/view/page/forgotpassword_page.dart';
import 'package:InLaw/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../viewmodel/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginViewModel> {
  late ColorScheme _colors;
  late ThemeData _theme;

  Widget get _loadingIndicator => Visibility(
        child: const LinearProgressIndicator(
          backgroundColor: Colors.blueGrey,
        ),
        visible: store.isLoading,
      );

  Widget get _Logo => Container(
        height: 130,
        width: 130,
        child: Image.asset('lib/assets/images/logo.png'),
      );

  Widget get _username => widget.createFormField(
        title: 'username'.i18n(),
        theme: _theme,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        hint: 'username_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.username,
        onChange: (value) => store.username = value,
      );

  Widget get _password => widget.createFormField(
        title: 'password'.i18n(),
        theme: _theme,
        keyboardType: TextInputType.text,
        obscureText: true,
        hint: 'password_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.password,
        onChange: (value) => store.password = value,
      );

  Widget get _loginButton => Container(
        margin: const EdgeInsets.fromLTRB(30, 15, 30, 5),
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          //onPressed: store.isLoading ? null : () {store.login, pop},
          //Navigator.pop(context);
          onPressed: store.isLoading ? null : store.login,
          child: Text('login'.i18n()),
        ),
      );

  Widget get _forgotPasswordButton => Container(
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 20),
        width: double.infinity,
        height: 56,
        child: TextButton(
          style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
          onPressed: store.isLoading
              ? null
              : () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage()));
                },
          child: Text('forgot_password'.i18n()),
        ),
      );

  Widget get _signUp => Container(
        margin: const EdgeInsets.fromLTRB(30, 40, 30, 30),
        height: 56,
        width: double.infinity,
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          onPressed: store.isLoading
              ? null
              : () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                  //Modular.to.pushNamed('/signup');
                },
          child: Text('signup'.i18n()),
        ),
      );

  Widget get _divider => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(
              child: Divider(thickness: 1, indent: 25, endIndent: 10)),
          Text(
            'divider_text'.i18n(),
            style: _theme.textTheme.headline6,
          ),
          const Expanded(
            child: Divider(
              thickness: 1,
              indent: 10,
              endIndent: 25,
            ),
          ),
        ],
      );

  Widget get _formBuild => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _loadingIndicator,
          const SizedBox(height: 5),
          Center(
            child: _Logo,
          ),
          const SizedBox(height: 5),
          _username,
          _password,
          _loginButton,
          _forgotPasswordButton,
          _divider,
          _signUp
        ],
      );

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _colors = _theme.colorScheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('InLaw')),
        body: Center(
          child: SingleChildScrollView(
            child: Observer(builder: (_) {
              return Form(child: _formBuild);
            }),
          ),
        ),
      ),
    );
  }
}
