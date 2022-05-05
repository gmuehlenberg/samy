import 'package:bloc_mvu_app/counter/counter_update.dart';
import 'package:bloc_mvu_app/mvu/messaging.dart';

abstract class CounterMessage extends UpdateMessage {
  CounterMessage() : super(routeTo: CounterUpdate);
}

class Increment extends CounterMessage {}

class Decrement extends CounterMessage {}

class SetTo extends CounterMessage {
  SetTo({required this.value});

  final int value;
}

class SetToAfterDelay extends CounterMessage {
  SetToAfterDelay({
    required this.seconds,
    required this.value,
  });

  final int seconds;
  final int value;
}
