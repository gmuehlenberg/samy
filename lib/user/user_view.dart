// ignore_for_file: unnecessary_cast

import 'package:samy_app/mvu/view.dart';
import 'package:samy_app/user/user_message.dart';
import 'package:samy_app/user/user_model.dart';
import 'package:samy_app/user/user_update.dart';
import 'package:flutter/material.dart' hide View;


class UserView extends View<UserMessage, UserModel, UserUpdate> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget buildView(UserModel model) => Scaffold(
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/background.jpg'),
        fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: model.user
                .map(
                  (user) => ListView(
                    children: [
                      Text('Mein Profil',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.teal[300]
                        )
                      ),
                      Container(
                        height: 15,
                        width: 1,
                      ),
                      Text('Vorname: ${user.firstName}'),
                      Container(
                        height: 15,
                        width: 1,
                      ),
                      Text('Nachname: ${user.lastName}'),
                      Container(
                        height: 15,
                        width: 1,
                      ),
                      Text('Adresse: ${user.street} ${user.streetNumber}, ${user.postCode} ${user.city}'),
                      Container(
                        height: 15,
                        width: 1,
                      ),
                      Text('Email: ${user.mail}'),
                      Container(
                        height: 15,
                        width: 1,
                      ),
                      Text(user.id.getOrElse(() => 'Keine ID vergeben')),
                      Container(
                         height: 30,
                          width: 1,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                          child: const Icon (Icons.list_alt_outlined)
                      ),
                      SizedBox(width: 300, child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Profil ändern')
                      )
                      ),
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
      )
  );
}

Widget userDetails(UserModel model) =>
    model.user.map((user) => Text('Vorname: ${user.firstName}')).getOrElse(() => const Text('Kein User ausgewählt'));
