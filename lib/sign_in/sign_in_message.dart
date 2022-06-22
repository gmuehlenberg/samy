import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/sign_in/sign_in_update.dart';

abstract class SignInMessage extends UpdateMessage {
  SignInMessage() : super(routeTo: SignInUpdate);
}

class ChangePasswordVisibility extends SignInMessage {}
