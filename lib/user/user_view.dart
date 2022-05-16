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
      Text('Nutzeransicht'),
      Text('Name: ' + model.surname + ' ' + model.lastname),
      Text('Straße: ' + model.street),
      Text('PLZ: ' + model.postCode),
      Text('Stadt: ' + model.city),
      Text('Mail-Adresse: ' + model.mail),
      FloatingActionButton(
        onPressed: () => dispatch(CreateUser()),
        tooltip: 'User einloggen',
        backgroundColor: Colors.purpleAccent,
        child: const Icon(Icons.login_rounded),
      ),
      FloatingActionButton(
        onPressed: () => dispatch(DeleteUser()),
        tooltip: 'User ausloggen',
        backgroundColor: Colors.purpleAccent,
        child: const Icon(Icons.logout_rounded),
      ),
    ],
  );
}
