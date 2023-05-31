import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/mvu/view.dart';
import 'package:samy_app/navigation/navigation_messages.dart';
import 'package:samy_app/navigation/navigation_model.dart';
import 'package:samy_app/navigation/navigation_update.dart';
import 'package:samy_app/offers/offers_view.dart';
import 'package:samy_app/offers_create/create_offer_view.dart';
import 'package:samy_app/pages/menu/menu_view.dart';
import 'package:samy_app/sign_in/sign_in_view.dart';
import 'package:samy_app/sign_up/sign_up_view.dart';
import 'package:samy_app/user/user_view.dart';
import 'package:flutter/material.dart' hide Page, View;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final drawerKey = UniqueKey();
final appBarKey = UniqueKey();

class NavigationView extends View<NavigationMessage, NavigationModel, NavigationUpdate> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget buildView(NavigationModel model) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          key: appBarKey,
          title: Text(
            prettyName(model.page),
          ),
          backgroundColor: Colors.blue,
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
        endDrawer: Drawer(
          key: drawerKey,
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
    case Page.offers_create:
      return CreateOfferView();
  }
}
