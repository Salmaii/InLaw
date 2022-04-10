import 'package:InLaw/src/features/auth/domain/model/sign_up_user.dart';

class SignUpUserDto {
  const SignUpUserDto(this.name, this.username, this.password);

  final String? name;
  final String? username;
  final String? password;

  factory SignUpUserDto.fromDomain(SignUpUser signUpUser) {
    return SignUpUserDto(signUpUser.name, signUpUser.username, signUpUser.password);
  }

  factory SignUpUserDto.fromJson(Map<String, dynamic> json) =>
      SignUpUserDto(json['name'], json['username'], json['password']);

  Map<String, dynamic> toJson() => {'name': name, 'username': username, 'password': password};
}
