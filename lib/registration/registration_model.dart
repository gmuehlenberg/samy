class RegistrationModel {
  RegistrationModel({
    required this.obscurePassword,
  });

  final bool obscurePassword;

  RegistrationModel copyWith({
    bool? obscurePassword,
  }) =>
      RegistrationModel(
        obscurePassword: obscurePassword ?? this.obscurePassword,
      );
}

final RegistrationModel initialRegistrationModel = RegistrationModel(
  obscurePassword: true,
);
