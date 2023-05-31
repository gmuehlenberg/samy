import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/sign_up/sign_up_update.dart';

abstract class SignUpMessage extends UpdateMessage {
  SignUpMessage() : super(routeTo: SignUpUpdate);
}

class ChangePasswordVisibility extends SignUpMessage {}

class SignUpUser extends SignUpMessage {}
