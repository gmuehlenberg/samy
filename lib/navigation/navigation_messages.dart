import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/navigation/navigation_model.dart';
import 'package:bloc_mvu_app/navigation/navigation_update.dart';

abstract class NavigationMessage extends UpdateMessage {
  NavigationMessage() : super(routeTo: NavigationUpdate);
}

class NavigateTo extends NavigationMessage {
  NavigateTo(this.target);

  final Page target;
}

class NavigateUp extends NavigationMessage {}

class ToggleMainMenu extends NavigationMessage {}
