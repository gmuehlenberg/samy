import 'package:bloc_mvu_app/counter/counter_view.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/navigation/navigation_messages.dart';
import 'package:bloc_mvu_app/navigation/navigation_model.dart';
import 'package:bloc_mvu_app/navigation/navigation_update.dart';
import 'package:flutter/material.dart';

class NavigationView extends View<NavigationMessage, NavigationModel, NavigationUpdate> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget buildView(NavigationModel model) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'MVU+BLoC Test app',
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.table_rows),
              tooltip: 'Menu',
              onPressed: () {},
            ),
          ],
        ),
        body: const Center(
          child: CounterView(),
        ),
      );
}
