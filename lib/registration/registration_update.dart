import 'package:bloc_mvu_app/registration/registration_message.dart';
import 'package:bloc_mvu_app/registration/registration_model.dart';
import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class RegistrationUpdate extends Update<RegistrationMessage, RegistrationModel> {
  RegistrationUpdate(RegistrationModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory RegistrationUpdate.of(BuildContext context) => RegistrationUpdate(initialRegistrationModel);

  @override
  Option<RegistrationModel> processMessage(RegistrationMessage message, RegistrationModel model) {
    if (message is Registration) {
      return Some(model.copyWith(isLoggedIn: true));
    }
    if (message is LogOut) {
      return Some(model.copyWith(isLoggedIn: false));
    }
    return const None();
  }
}
