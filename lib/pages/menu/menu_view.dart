import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view_without_model.dart';
import 'package:bloc_mvu_app/navigation/navigation_messages.dart';
import 'package:bloc_mvu_app/navigation/navigation_model.dart';
import 'package:flutter/material.dart' hide Page;

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
  Widget buildView() => Drawer (
    child: ListView(
      // Remove padding
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('Vorname Nachname'),
          accountEmail: Text('example@gmail.com'),
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
                image: NetworkImage(
                    'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
          ),
        ),

        _button('Login',Icon(Icons.login), Page.login),
        const Divider(),
        _button('User',Icon(Icons.supervised_user_circle), Page.user),
        _button('Registration',Icon(Icons.app_registration), Page.registration),
        _button('SignUp',Icon(Icons.login), Page.signUp)
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
          _button('Registration', Page.registration),
          _button('SignUp', Page.signUp)
        ],
      );
}
 */