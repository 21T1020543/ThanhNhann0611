class LoginRequest {
  final String email;
  final String password;
  final int expiresInMins;
  LoginRequest(
      {required this.email, required this.password, this.expiresInMins = 30});

  Map<String, dynamic> toJson() {
    return {
      'username': email,
      'password': password,
      'expiresInMins': expiresInMins,
    };
  }
}
