class SignUpModel {
  SignUpModel({
    required this.obscurePassword,
  });

  final bool obscurePassword;

  SignUpModel copyWith({
    bool? obscurePassword,
  }) =>
      SignUpModel(
        obscurePassword: obscurePassword ?? this.obscurePassword,
      );
}

final SignUpModel initialSignUpModel =
    SignUpModel(obscurePassword: true,);
