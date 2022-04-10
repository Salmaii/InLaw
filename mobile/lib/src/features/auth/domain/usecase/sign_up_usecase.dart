import 'package:InLaw/src/features/auth/domain/repository/sign_up_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../model/sign_up_user.dart';

class SignUpUseCase {
  final repository = Modular.get<ISignUp>();

  String? validateName(String name) {
    if (name.isEmpty) {
      return 'name_required'.i18n();
    }
    return null;
  }
 
  String? validateUsername(String username) {
    if (username.isEmpty) {
      return 'username_required'.i18n();
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'login_password_required'.i18n();
    }
    return null;
  }

  Future<SignUpUser> signUp(String name,String username, String password) {
    return repository.signUp(SignUpUser(name, username, password));
  }
}
