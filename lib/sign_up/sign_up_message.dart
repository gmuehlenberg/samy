import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_update.dart';

abstract class SignUpMessage extends UpdateMessage {
  SignUpMessage() : super(routeTo: SignUpUpdate);
}

class ChangePasswordVisibility extends SignUpMessage {}

class SignUpUser extends SignUpMessage {}
