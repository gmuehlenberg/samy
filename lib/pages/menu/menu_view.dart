import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view_without_model.dart';
import 'package:bloc_mvu_app/navigation/navigation_messages.dart';
import 'package:bloc_mvu_app/navigation/navigation_model.dart';
import 'package:flutter/material.dart' hide Page;

Widget _button(String text, Page target) => ElevatedButton(
      onPressed: () {
        dispatch(NavigateUp());
        dispatch(NavigateTo(target));
      },
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black54)),
      child: Tooltip(message: text, child: Text(text)),
    );

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
        ],
      );
}
