import 'package:bloc_mvu_app/logging/logging.dart';
import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:bloc_mvu_app/navigation/navigation_messages.dart';
import 'package:bloc_mvu_app/navigation/navigation_model.dart';
import 'package:bloc_mvu_app/navigation/navigation_view.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' hide Page;

class NavigationUpdate extends Update<NavigationMessage, NavigationModel> {
  NavigationUpdate(NavigationModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory NavigationUpdate.of(BuildContext context) => NavigationUpdate(initialNavigationModel);

  @override
  Option<NavigationModel> processMessage(
    NavigationMessage message,
    NavigationModel model,
  ) {
    if (message is NavigateUp) {
      navigatorKey.currentState?.pop();
      return const None();
    }

    if (message is NavigateTo) {
      return Some(model.copyWith(page: message.target));
    }
    if (message is ToggleMainMenu) {
      final currentState = scaffoldKey.currentState;
      if (currentState != null) {
        if (currentState.isDrawerOpen) {
          dispatch(NavigateUp());
        } else {
          scaffoldKey.currentState?.openEndDrawer();
        }
      }
      return const None();
    }
    logger.e('Unimplemented message update $message');
    return const None();
  }
}
