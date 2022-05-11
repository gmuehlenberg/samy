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
          Text('User ist ${model.isLoggedIn ? 'ein' : 'aus'}geloggt'),
          FloatingActionButton(
            onPressed: () => dispatch(LogIn()),
            tooltip: 'User einloggen',
            backgroundColor: Colors.purpleAccent,
            child: const Icon(Icons.login_rounded),
          ),
          FloatingActionButton(
            onPressed: () => dispatch(LogOut()),
            tooltip: 'User ausloggen',
            backgroundColor: Colors.purpleAccent,
            child: const Icon(Icons.logout_rounded),
          ),
        ],
      );
}
