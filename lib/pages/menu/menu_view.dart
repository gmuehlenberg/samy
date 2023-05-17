import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view_without_model.dart';
import 'package:bloc_mvu_app/navigation/navigation_messages.dart';
import 'package:bloc_mvu_app/navigation/navigation_model.dart';
import 'package:bloc_mvu_app/user/panel_view.dart';
import 'package:flutter/material.dart' hide Page, View;

Widget _button(String title, Icon icon, Page target) => ListTile(
      onTap: () {
        dispatch(NavigateUp());
        dispatch(NavigateTo(target));
      },
      leading: icon,
      title: Text(title),
    );

class MenuView extends ViewWithoutModel {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget buildView() => Drawer(
        child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            const UserPanelView(

            ),
            _button('SignUp', const Icon(Icons.login), Page.signUp),
            _button('SignIn', const Icon(Icons.app_registration), Page.signIn),
            const Divider(),
            _button('User', const Icon(Icons.supervised_user_circle), Page.user),
            _button('Create Offer', const Icon(Icons.note_add), Page.offers_create),
            _button('View Offers', const Icon(Icons.school), Page.offers),
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
