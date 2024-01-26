class Login {
  final String email;
  final String token;
  final String cookie;

  Login({
    this.email = '',
    this.token = '',
    this.cookie = '',
  });

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      cookie: map['cookie'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'token': token,
      'cookie': cookie,
    };
  }
}
