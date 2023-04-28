// ignore_for_file: constant_identifier_names

class NavigationModel {
  NavigationModel(this.page);

  final Page page;

  NavigationModel copyWith({
    Page? page,
  }) =>
      NavigationModel(page ?? this.page);
}

final NavigationModel initialNavigationModel = NavigationModel(Page.signIn);

enum Page { user, signIn, signUp, offers, offers_create }
