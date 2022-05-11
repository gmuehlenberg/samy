import 'package:bloc_mvu_app/login/login_message.dart';
import 'package:bloc_mvu_app/login/login_model.dart';
import 'package:bloc_mvu_app/mvu/side_effect.dart';
import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class LoginUpdate extends Update<LoginMessage, LoginModel> {
  LoginUpdate(LoginModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory LoginUpdate.of(BuildContext context) => LoginUpdate(initialLoginModel);

  @override
  Option<LoginModel> processMessage(LoginMessage message, LoginModel model) {
    if (message is LogIn) {
      return Some(model.copyWith(isLoggedIn: model.isLoggedIn = true));
    }
    if (message is LogOut) {
      //return Some(model.copyWith(count: model.count - 1));
      return Some(model.copyWith(isLoggedIn: model.isLoggedIn = false));
    }
    return const None();
  }
}
