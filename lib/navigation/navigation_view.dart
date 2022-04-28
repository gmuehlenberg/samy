import 'package:bloc_mvu_app/counter/counter_view.dart';
import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/navigation/navigation_messages.dart';
import 'package:bloc_mvu_app/navigation/navigation_model.dart';
import 'package:bloc_mvu_app/navigation/navigation_update.dart';
import 'package:bloc_mvu_app/pages/menu/menu_view.dart';
import 'package:flutter/material.dart' hide Page;

class NavigationView
    extends View<NavigationMessage, NavigationModel, NavigationUpdate> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget buildView(NavigationModel model) => Scaffold(
    key: scaffoldKey,
    appBar: AppBar(
          title: const Text(
            'MVU+BLoC Test app',
          ),
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
    case Page.counter:
      return const CounterView();
  }
}
