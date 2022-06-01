import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/user/user_message.dart';
import 'package:bloc_mvu_app/user/user_model.dart';
import 'package:bloc_mvu_app/user/user_update.dart';
import 'package:flutter/material.dart';

class UserView extends View<UserMessage, UserModel, UserUpdate> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget buildView(UserModel model) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Text('Nutzeransicht'),
                userDetails(model),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}

Widget userDetails(UserModel model) =>
    model.user.map((user) => Text('Vorname: ${user.surname}')).getOrElse(() => Text('Kein User ausgewählt'));
