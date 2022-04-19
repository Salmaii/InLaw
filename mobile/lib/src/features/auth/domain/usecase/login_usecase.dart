import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../model/user.dart';
import '../repository/login_interface.dart';

class LoginUseCase {
  final repository = Modular.get<ILogin>();

  String? validateUsername(String username) {
    if (username.isEmpty) {
      return 'username_required'.i18n();
    }

    if (username.contains('#') ||
        username.contains('&') ||
        username.contains('=') ||
        username.contains('+') ||
        username.contains(',') ||
        username.contains('<') ||
        username.contains('>') ||
        username.contains(' ') ||
        username.contains('..')) {
      return 'username_invalid_special'.i18n();
    }

    if (username.startsWith('0') ||
        username.startsWith('1') ||
        username.startsWith('2') ||
        username.startsWith('3') ||
        username.startsWith('4') ||
        username.startsWith('5') ||
        username.startsWith('6') ||
        username.startsWith('7') ||
        username.startsWith('8') ||
        username.startsWith('9')) {
      return 'username_invalid_start_number'.i18n();
    }

    return null;
  }

  String? validatePassword(String password, String username) {
    if (password.isEmpty) {
      return 'password_required'.i18n();
    }

    if (password.contains('#') ||
        password.contains('&') ||
        password.contains('=') ||
        password.contains('+') ||
        password.contains(',') ||
        password.contains('<') ||
        password.contains('>') ||
        password.contains(' ') ||
        password.contains('..')) {
      return 'password_invalid_special'.i18n();
    }

    if (password.contains('01') ||
        password.contains('12') ||
        password.contains('23') ||
        password.contains('34') ||
        password.contains('45') ||
        password.contains('56') ||
        password.contains('67') ||
        password.contains('78') ||
        password.contains('89')) {
      return 'password_invalid_sequence'.i18n();
    }

    if (password.contains(username)) {
      return 'password_invalid_username'.i18n();
    }

    return null;
  }

  Future<User> login(String username, String password) {
    return repository.login(User(username, password));
  }
}
