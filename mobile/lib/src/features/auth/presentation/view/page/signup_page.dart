import 'package:flutter/material.dart';
import 'package:InLaw/src/common/form_text_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../viewmodel/sign_up_viewmodel.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpViewModel> {
  late ColorScheme _colors;
  late ThemeData _theme;

  Widget get _loadingIndicator => Visibility(
        child: const LinearProgressIndicator(
          backgroundColor: Colors.blueGrey,
        ),
        visible: store.isLoading,
  );

  Widget get _name => widget.createFormField(
        title: 'name'.i18n(),
        theme: _theme,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        hint: 'name_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.name,
        //errorText: store.error.name,
        onChange: (value) => store.name = value,
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

  Widget get _signUpButton => Container(
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
          child: Text('signup'.i18n()),
        ),
      );

  Widget get _backToLoginButton => Container(
          margin: const EdgeInsets.fromLTRB(30, 30, 30, 20),
          width: double.infinity,
          height: 56,
          child: TextButton(
            style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
            onPressed: store.isLoading 
                ? null 
                : () {
                  Navigator.pop(
                    context,
                  );
                },
            child: Text('already_have_an_account'.i18n()),
          ),
        );

  Widget get _formBuild => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _loadingIndicator,
                  const SizedBox(height: 5),
                  _name,
                  _username,
                  _password,
                  _signUpButton,
                  _backToLoginButton,
                ],
              );

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _colors = _theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          child: Observer(builder: (_) {
            return Form(child: _formBuild);
          }),
        ),
      ),
    );
  }
}
