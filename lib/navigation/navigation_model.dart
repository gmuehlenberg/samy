import 'package:flutter/material.dart' hide Page;

class NavigationModel {
  NavigationModel(this.page);

  final Page page;

  NavigationModel copyWith({
    Page? page,
  }) =>
      NavigationModel(page ?? this.page);
}

final NavigationModel initialNavigationModel = NavigationModel(Page.signIn);

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

enum Page { user, signIn, signUp, offers }
