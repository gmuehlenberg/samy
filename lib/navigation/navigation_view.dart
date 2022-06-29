import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/navigation/navigation_messages.dart';
import 'package:bloc_mvu_app/navigation/navigation_model.dart';
import 'package:bloc_mvu_app/navigation/navigation_update.dart';
import 'package:bloc_mvu_app/offers/offers_view.dart';
import 'package:bloc_mvu_app/pages/menu/menu_view.dart';
import 'package:bloc_mvu_app/sign_in/sign_in_view.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_view.dart';
import 'package:bloc_mvu_app/user/user_view.dart';
import 'package:flutter/material.dart' hide Page;

class NavigationView extends View<NavigationMessage, NavigationModel, NavigationUpdate> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget buildView(NavigationModel model) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text(
            'SAMY',
          ),
          backgroundColor: Colors.greenAccent,
          actions: [
            IconButton(
              icon: const Icon(Icons.table_rows),
              tooltip: 'Menu',
              onPressed: () => dispatch(ToggleMainMenu()),
            ),
          ],
        ),
        body: Center(
          child: widgetFor(model.page),
        ),
        endDrawer: const Drawer(
          child: MenuView(),
        ),
      );
}

Widget widgetFor(Page page) {
  switch (page) {
    case Page.user:
      return const UserView();
    case Page.signIn:
      return const SignInView();
    case Page.signUp:
      return const SignUpView();
    case Page.offers:
      return const OffersView();
  }
}
