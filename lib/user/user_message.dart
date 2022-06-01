import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/user/user_update.dart';
import 'package:bloc_mvu_app/user/user_model.dart';

abstract class UserMessage extends UpdateMessage {
  UserMessage() : super(routeTo: UserUpdate);
}

class CreateUser extends UserMessage {}

class ChangeUser extends UserMessage {}

class UpdateUserInfo extends UserMessage {
  UpdateUserInfo(User user);
}

class DeleteUser extends UserMessage {}
