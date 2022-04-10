class SignUpUser {
  const SignUpUser(this.name, this.username, this.password, {this.token});

  final String name;
  final String username;
  final String? password;
  final String? token;

  factory SignUpUser.fromJson(Map<String, dynamic> json) =>
      SignUpUser(json['name'] ,json['username'], json['password'], token: json['token']);
}
