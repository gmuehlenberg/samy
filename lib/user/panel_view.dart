import 'package:samy_app/mvu/view.dart';
import 'package:samy_app/user/user_message.dart';
import 'package:samy_app/user/user_model.dart';
import 'package:samy_app/user/user_update.dart';
import 'package:flutter/material.dart' hide View;

class UserPanelView extends View<UserMessage, UserModel, UserUpdate> {
  const UserPanelView({Key? key}) : super(key: key);

  @override
  Widget buildView(UserModel model) => UserAccountsDrawerHeader(
    accountName: Text(model.user.map((user) => '${user.firstName} ${user.lastName}').getOrElse(() => '')),
    accountEmail: Text(model.user.map((user) => user.mail).getOrElse(() => '')),
    currentAccountPicture: CircleAvatar(
      child: ClipOval(
        child: Image.network(
          'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
          fit: BoxFit.cover,
          width: 90,
          height: 90,
        ),
      ),
    ),
    decoration: const BoxDecoration(
      color: Colors.blue,
      image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
      ),
    ),
  );
}

Widget userDetails(UserModel model) =>
    model.user.map((user) => Text('Vorname: ${user.firstName}')).getOrElse(() => const Text('Kein User ausgewählt'));
