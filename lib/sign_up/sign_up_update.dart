import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_message.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class SignUpUpdate extends Update<SignUpMessage, SignUpModel> {
  SignUpUpdate(SignUpModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory SignUpUpdate.of(BuildContext context) => SignUpUpdate(initialSignUpModel);

  @override
  Option<SignUpModel> processMessage(SignUpMessage message, SignUpModel model) {
    if (message is ChangePasswordVisibility) {
      return Some(model.copyWith(obscurePassword: !model.obscurePassword));
    }
    if (message is SignUpUser) {
      //Frage: Wie UserModel kopieren??
      //Antwort: UserModel userModel = UserModel.get();

      model.firstNameController.text;
    }
    return const None();
  }
}
