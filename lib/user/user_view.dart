import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/user/user_message.dart';
import 'package:bloc_mvu_app/user/user_model.dart';
import 'package:bloc_mvu_app/user/user_update.dart';
import 'package:flutter/material.dart';

class UserView extends View<UserMessage, UserModel, UserUpdate> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget buildView(UserModel model) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Nutzeransicht'),
          //restlicher Inhalt hier hin
        ],
      );
}
