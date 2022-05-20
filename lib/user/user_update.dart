import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:bloc_mvu_app/user/user_message.dart';
import 'package:bloc_mvu_app/user/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class UserUpdate extends Update<UserMessage, UserModel> {
  UserUpdate(UserModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory UserUpdate.of(BuildContext context) => UserUpdate(initialUserModel);

  @override
  Option<UserModel> processMessage(UserMessage message, UserModel model) {
    if (message is CreateUser) {
      return Some(
        model.copyWith(
          surname: 'Neuer',
          lastname: 'Olive Tree',
          street: 'Karl-Liebknecht-Straße 38',
          city: 'Leipzig',
          postCode: '04107',
          mail: 'döner@olivetree.de',
          password: 'dönermachtschöner123',
        ),
      );
    }
    /*if (message is ChangeUser) {
      return Some(model.copyWith(isLoggedIn: false));
    }
    if (message is DeleteUser) {
      return Some(model.copyWith(isLoggedIn: false));
    }*/
    return const None();
  }
}
