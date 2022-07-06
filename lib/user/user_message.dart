import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/user/user_model.dart';
import 'package:bloc_mvu_app/user/user_update.dart';

abstract class UserMessage extends UpdateMessage {
  UserMessage() : super(routeTo: UserUpdate);
}

class CreateUser extends UserMessage {
  CreateUser(this.user);

  final User user;
}

class ExchangeLoggedInUser extends UserMessage {
  ExchangeLoggedInUser(this.user);

  final User user;
}

class ChangeUser extends UserMessage {}

class UpdateUserInfo extends UserMessage {
  UpdateUserInfo();
}

class DeleteUser extends UserMessage {}
