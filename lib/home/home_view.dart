import 'package:bloc_mvu_app/config/config_model.dart';
import 'package:bloc_mvu_app/counter/counter_view.dart';
import 'package:bloc_mvu_app/mvu/view_without_model.dart';
import 'package:flutter/material.dart';

class HomeView extends ViewWithoutModel {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget buildView() => Scaffold(
        appBar: AppBar(
          title: Text(
            ConfigModel.get().environment,
          ),
        ),
        body: const Center(
          child: CounterView(),
        ),
      );
}
