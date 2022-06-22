// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:bloc_mvu_app/user/user_message.dart';
import 'package:bloc_mvu_app/user/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserUpdate extends Update<UserMessage, UserModel> {
  UserUpdate(UserModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory UserUpdate.of(BuildContext context) => UserUpdate(initialUserModel);

  @override
  Option<UserModel> processMessage(UserMessage message, UserModel model) {
    if (message is CreateUser) {
      addUserToBackend(message.user);
      return Some(model.copyWith(some(message.user)));
    }

    /*if (message is UpdateUserInfo) {
      return Some(model.copyWith());
    }*/
    /*if (message is ChangeUser) {
      return Some(model.copyWith(isLoggedIn: false));
    }
    if (message is DeleteUser) {
      return Some(model.copyWith(isLoggedIn: false));
    }*/
    return const None();
  }

  Future<User> addUserToBackend(User user) async {
    final url = Uri.parse('https://samy-backend-ybaxbalfwa-ey.a.run.app/api/sign-up');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json', 'token': 'token123'},
      body: json.encode({
        'surname': user.surname,
        'lastname': user.lastname,
        'street': user.street,
        'city': user.city,
        'mail': user.mail,
        'postCode': user.postCode,
        'password': user.password
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return User.fromJSON(jsonDecode(response.body) as Map<String, dynamic>); // data noch editieren!
  }
}
