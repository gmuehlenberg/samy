import 'package:bloc_mvu_app/login/login_update.dart';
import 'package:bloc_mvu_app/mvu/messaging.dart';

abstract class LoginMessage extends UpdateMessage {
  LoginMessage() : super(routeTo: LoginUpdate);
}

class LogIn extends LoginMessage {}

class LogOut extends LoginMessage {}

class SetTo extends LoginMessage {
  SetTo({required this.value});

  final int value;
}
