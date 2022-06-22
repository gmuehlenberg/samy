class SignInModel {
  SignInModel({
    required this.obscurePassword,
  });

  final bool obscurePassword;

  SignInModel copyWith({
    bool? obscurePassword,
  }) =>
      SignInModel(
        obscurePassword: obscurePassword ?? this.obscurePassword,
      );
}

final SignInModel initialSignInModel = SignInModel(
  obscurePassword: true,
);
