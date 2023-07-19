import 'package:samy_app/logging/logging.dart';
import 'package:samy_app/mvu/update.dart';

/// A message than can be routed anywhere
abstract class Message {}

/// A message that targets an MVU component
abstract class UpdateMessage extends Message {
  UpdateMessage({required this.routeTo});

  final Type routeTo;
}

/// Global message routing.
void dispatch(final Message message) {
  if (message is UpdateMessage) {
    final update = updateByType[message.routeTo];

    if (update != null) {
      update.add(message);
      return;
    }

    logger.e(
      'An Update must be registered for every subtype of UpdateMessage. '
      'For ${message.runtimeType} there is none!',
    );
  }
}
