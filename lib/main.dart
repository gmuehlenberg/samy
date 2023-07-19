import 'dart:convert'; // For jsonDecode

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_theme/json_theme.dart';
import 'package:samy_app/config/config_update.dart';
import 'package:samy_app/navigation/navigation_update.dart';
import 'package:samy_app/navigation/navigation_view.dart';
import 'package:samy_app/offers/offers_update.dart';
import 'package:samy_app/offers_create/create_offer_update.dart';
import 'package:samy_app/sign_in/sign_in_update.dart';
import 'package:samy_app/sign_up/sign_up_update.dart';
import 'package:samy_app/user/user_update.dart';

/// Entry widget
class SamyApp extends StatelessWidget {
  const SamyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: const [
          BlocProvider(create: NavigationUpdate.of),
          BlocProvider(create: ConfigUpdate.of, lazy: false),
          BlocProvider(create: UserUpdate.of, lazy: false),
          BlocProvider(create: SignInUpdate.of),
          BlocProvider(create: SignUpUpdate.of),
          BlocProvider(create: OffersUpdate.of),
          BlocProvider(create: CreateOfferUpdate.of),
        ],
        child: ThemedSamyApp(),
      );
}

class ThemedSamyApp extends StatefulWidget {
  const ThemedSamyApp({Key? key}) : super(key: key);

  @override
  State<ThemedSamyApp> createState() => SamyAppState();
}

class SamyAppState extends State<ThemedSamyApp> {
  ThemeData? theme;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/appainter_theme.json').then((value) {
      final themeJson = jsonDecode(value);
      final themeData = ThemeDecoder.decodeThemeData(themeJson)!;
      setState(() {
        theme = themeData;
      });
    });
    ;
  }

  @override
  Widget build(BuildContext context) => theme == null
      ? const Center(child: CircularProgressIndicator())
      : MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Samy-App',
          theme: theme,
          home: const NavigationView(),
        );
}

void main() {
  runApp(SamyApp());
}
