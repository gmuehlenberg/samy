import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/registration/registration_update.dart';

abstract class RegistrationMessage extends UpdateMessage {
  RegistrationMessage() : super(routeTo: RegistrationUpdate);
}

class ChangePasswordVisibility extends RegistrationMessage {}
