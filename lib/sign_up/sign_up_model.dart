import 'package:flutter/material.dart';
import 'package:bloc_mvu_app/mvu/update.dart';

// Define a custom Form widget.

class SignUpModel {
  SignUpModel({required this.obscurePassword});

  final bool obscurePassword;

  TextEditingController surnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController streetController = new TextEditingController();
  TextEditingController streetNumberController = new TextEditingController();
  TextEditingController postCodeController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
