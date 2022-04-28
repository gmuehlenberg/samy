import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:bloc_mvu_app/navigation/navigation_messages.dart';
import 'package:bloc_mvu_app/navigation/navigation_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class NavigationUpdate extends Update<NavigationMessage, NavigationModel> {
  NavigationUpdate(NavigationModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory NavigationUpdate.of(BuildContext context) => NavigationUpdate(initialNavigationModel);

  @override
  Option<NavigationModel> processMessage(NavigationMessage message, NavigationModel model) => const None();
}
