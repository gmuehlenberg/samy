import 'package:bloc_mvu_app/login/login_message.dart';
import 'package:bloc_mvu_app/login/login_model.dart';
import 'package:bloc_mvu_app/login/login_update.dart';
import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:flutter/material.dart';

class LoginView extends View<LoginMessage, LoginModel, LoginUpdate> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget buildView(LoginModel model) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (model.isLoggedIn == true) ...[
            Text('User ist eingeloggt')
          ] else if (model.isLoggedIn == false) ...[
            Text('User ist ausgeloggt')
          ], // Text('')
          FloatingActionButton(
            onPressed: () => dispatch(LogIn()),
            tooltip: 'User einloggen',
            child: Icon(Icons.login_rounded),
            backgroundColor: Colors.purpleAccent,
          ),
          FloatingActionButton(
            onPressed: () => dispatch(LogOut()),
            tooltip: 'User ausloggen',
            child: Icon(Icons.logout_rounded),
            backgroundColor: Colors.purpleAccent,
          ),
        ],
      );
}
