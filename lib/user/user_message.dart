import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/user/user_update.dart';

abstract class UserMessage extends UpdateMessage {
  UserMessage() : super(routeTo: UserUpdate);
}

class CreateUser extends UserMessage {}

class ChangeUser extends UserMessage {}

class DeleteUser extends UserMessage {}
