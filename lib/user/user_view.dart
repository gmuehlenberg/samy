// ignore_for_file: unnecessary_cast

import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/user/user_message.dart';
import 'package:bloc_mvu_app/user/user_model.dart';
import 'package:bloc_mvu_app/user/user_update.dart';
import 'package:flutter/material.dart' hide View;

class UserView extends View<UserMessage, UserModel, UserUpdate> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget buildView(UserModel model) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: model.user
                .map(
                  (user) => ListView(
                    children: [
                      const Text('Nutzeransicht'),
                      Text('Vorname: ${user.surname}'),
                      Text('Nachname: ${user.lastname}'),
                      Text('Adresse: ${user.street} ${user.streetNumber}, ${user.postCode} ${user.city}'),
                      Text('Email: ${user.mail}'),
                      Text(user.id.getOrElse(() => 'Keine ID vergeben')),
                      //userDetails(model),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(),
                        ],
                      ),
                    ],
                  ) as Widget,
                )
                .getOrElse(() => const Text('Kein User ausgewählt')),
          ),
        ),
      );
}

Widget userDetails(UserModel model) =>
    model.user.map((user) => Text('Vorname: ${user.surname}')).getOrElse(() => const Text('Kein User ausgewählt'));
