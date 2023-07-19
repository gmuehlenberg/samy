import 'package:samy_app/mvu/update.dart';
import 'package:samy_app/sign_in/sign_in_message.dart';
import 'package:samy_app/sign_in/sign_in_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class SignInUpdate extends Update<SignInMessage, SignInModel> {
  SignInUpdate(SignInModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory SignInUpdate.of(BuildContext context) => SignInUpdate(initialSignInModel);

  @override
  Option<SignInModel> processMessage(SignInMessage message, SignInModel model) {
    if (message is ChangePasswordVisibility) {
      return Some(model.copyWith(obscurePassword: !model.obscurePassword));
    }
    return const None();
  }
}
