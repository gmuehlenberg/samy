import 'package:samy_app/mvu/view.dart';
import 'package:samy_app/user/user_message.dart';
import 'package:samy_app/user/user_model.dart';
import 'package:samy_app/user/user_update.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_svg/flutter_svg.dart';

class UserPanelView extends View<UserMessage, UserModel, UserUpdate> {
  const UserPanelView({Key? key}) : super(key: key);

  @override
  Widget buildView(UserModel model) => UserAccountsDrawerHeader(
    accountName: Text(model.user.map((user) => '${user.firstName} ${user.lastName}').getOrElse(() => '')),
    accountEmail: Text(model.user.map((user) => user.mail).getOrElse(() => '')),
    currentAccountPicture: CircleAvatar(
      child: ClipOval(
        child: SvgPicture.asset(
          'assets/logo.svg',
          fit: BoxFit.cover,
          width: 90,
          height: 90,
        ),
      ),
    ),
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/hills.jpg'),
      ),
    ),
  );
}

Widget userDetails(UserModel model) =>
    model.user.map((user) => Text('Vorname: ${user.firstName}')).getOrElse(() => const Text('Kein User ausgewählt'));
