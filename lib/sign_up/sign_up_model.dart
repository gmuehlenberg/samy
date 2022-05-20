import 'package:flutter/material.dart';

// Define a custom Form widget.

class SignUpModel {
  SignUpModel({required this.obscurePassword});

  final bool obscurePassword;

  TextEditingController surnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController streetNumberController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUpModel copyWith({
    bool? obscurePassword,
  }) =>
      SignUpModel(
        obscurePassword: obscurePassword ?? this.obscurePassword,
      );
}

final SignUpModel initialSignUpModel = SignUpModel(
  obscurePassword: true,
);
