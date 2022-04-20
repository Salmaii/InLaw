import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../model/user.dart';
import '../repository/login_interface.dart';

class LoginUseCase {
  final repository = Modular.get<ILogin>();

  String? validateUsername(String username) {
    if (username.isEmpty) return 'username_required'.i18n();
    if (username.contains(RegExp(r"[0-9]"))) return 'username_invalid_number'.i18n();
    if (username.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return 'username_invalid_special'.i18n();
    return null;
  }

  String? validatePassword(String password, String username) {
    if (password.isEmpty) return 'password_required'.i18n();
    if (password.length < 8) return 'password_invalid_lenght'.i18n();
    if (!password.contains(RegExp(r"[a-z]"))) return 'password_invalid_upper_case'.i18n();
    if (!password.contains(RegExp(r"[A-Z]"))) return 'password_invalid_lower_case'.i18n();
    if (!password.contains(RegExp(r"[0-9]"))) return 'password_invalid_number'.i18n();
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return 'password_invalid_special'.i18n();
    return null;
  }

  Future<User> login(String username, String password) {
    return repository.login(User(username, password));
  }
}