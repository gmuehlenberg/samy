// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/mvu/update.dart';
import 'package:samy_app/user/user_message.dart';
import 'package:samy_app/user/user_model.dart';
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
      addUserToBackend(message.user)
          .then((user) => dispatch(ExchangeLoggedInUser(user)))
          .catchError((dynamic error) {
        print('Error: $error');
      });
      return const None();
    }

    if (message is ExchangeLoggedInUser) {
      return Some(model.copyWith(Some(message.user)));
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
    final localUrl = Uri.parse('http://localhost:3000/sign-up');

    final response = await http.post(
      localUrl,
      headers: {'Content-Type': 'application/json', 'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDY0ZDhkN2M4ZTNkM2I1YzEyNjU2ZTciLCJpYXQiOjE2ODQzMzA3MTEsImV4cCI6MTY4NDQxNzExMX0.CyT913nzztrBH9fOaL3f3mzAz94qGKDzgFg6pMTmIPw'},
      body: json.encode({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'street': user.street,
        'streetNumber': user.streetNumber,
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
