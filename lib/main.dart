import 'package:bloc_mvu_app/config/config_update.dart';
import 'package:bloc_mvu_app/counter/counter_update.dart';
import 'package:bloc_mvu_app/login/login_update.dart';
import 'package:bloc_mvu_app/navigation/navigation_model.dart';
import 'package:bloc_mvu_app/navigation/navigation_update.dart';
import 'package:bloc_mvu_app/navigation/navigation_view.dart';
import 'package:bloc_mvu_app/offers/offers_update.dart';
import 'package:bloc_mvu_app/registration/registration_update.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_update.dart';
import 'package:bloc_mvu_app/user/user_update.dart';
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
          BlocProvider(create: LoginUpdate.of),
          BlocProvider(create: UserUpdate.of),
          BlocProvider(create: RegistrationUpdate.of),
          BlocProvider(create: SignUpUpdate.of),
          BlocProvider(create: OffersUpdate.of),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'LoginApp',
          home: const NavigationView(),
        ),
      );
}

void main() {
  runApp(const BlocMvuTestApp());
}
