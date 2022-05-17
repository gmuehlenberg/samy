class RegistrationModel {
  RegistrationModel({
    required this.obscurePassword,
    required this.savePasswordIsChecked,
  });

  final bool obscurePassword;
  final bool savePasswordIsChecked;

  RegistrationModel copyWith({
    bool? obscurePassword,
    bool? savePasswordIsChecked,
  }) =>
      RegistrationModel(
        obscurePassword: obscurePassword ?? this.obscurePassword,
        savePasswordIsChecked: savePasswordIsChecked ?? this.savePasswordIsChecked,
      );
}

final RegistrationModel initialRegistrationModel =
    RegistrationModel(obscurePassword: false, savePasswordIsChecked: false);
