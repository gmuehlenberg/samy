import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/mvu/view_without_model.dart';
import 'package:samy_app/navigation/navigation_messages.dart';
import 'package:samy_app/navigation/navigation_model.dart';
import 'package:samy_app/user/panel_view.dart';
import 'package:flutter/material.dart' hide Page, View;
import 'package:samy_app/util/utils.dart';

Widget _button(Page page, Icon icon) => ListTile(
      onTap: () {
        dispatch(NavigateUp());
        dispatch(NavigateTo(page));
      },
      leading: icon,
      title: Text(prettyName(page)),
    );

class MenuView extends ViewWithoutModel {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget buildView() => Drawer(
        child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            samyLogo,
            const UserPanelView(

            ),
            _button(Page.signUp, const Icon(Icons.login)),
            _button(Page.signIn, const Icon(Icons.app_registration)),
            const Divider(),
            _button(Page.user, const Icon(Icons.supervised_user_circle)),
            _button(Page.offers_create, const Icon(Icons.note_add)),
            _button(Page.offers, const Icon(Icons.school)),
          ],
        ),
      );
}

// Backup (läuft)
/*
class MenuView extends ViewWithoutModel {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget buildView() => ListView(
        padding: const EdgeInsets.all(5),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),
            child: Text('Menu'),
          ),
          _button('Login', Page.login),
          _button('User', Page.user),
          _button('Registration', Page.sign_in),
          _button('SignUp', Page.signUp)
        ],
      );
}
 */
