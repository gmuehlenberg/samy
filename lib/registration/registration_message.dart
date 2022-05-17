import 'package:bloc_mvu_app/registration/registration_update.dart';
import 'package:bloc_mvu_app/mvu/messaging.dart';

abstract class RegistrationMessage extends UpdateMessage {
  RegistrationMessage() : super(routeTo: RegistrationUpdate);
}

class changePasswordVisibilityMsg extends RegistrationMessage {}
