import 'package:bloc_mvu_app/config/config_update.dart';
import 'package:bloc_mvu_app/counter/counter_update.dart';
import 'package:bloc_mvu_app/navigation/navigation_update.dart';
import 'package:bloc_mvu_app/navigation/navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Entry widget
class BlocMvuTestApp extends StatelessWidget {
  const BlocMvuTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: const [
          BlocProvider(create: NavigationUpdate.of),
          BlocProvider(create: ConfigUpdate.of, lazy: false),
          BlocProvider(create: CounterUpdate.of),
        ],
        child: const MaterialApp(
          title: 'BLoC+MVU Test App',
          home: NavigationView(),
        ),
      );
}

void main() {
  runApp(const BlocMvuTestApp());
}
