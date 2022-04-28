import 'package:bloc_mvu_app/counter/counter_messages.dart';
import 'package:bloc_mvu_app/counter/counter_model.dart';
import 'package:bloc_mvu_app/mvu/side_effect.dart';
import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class CounterUpdate extends Update<CounterMessage, CounterModel> {
  CounterUpdate(CounterModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory CounterUpdate.of(BuildContext context) =>
      CounterUpdate(initialCounterModel);

  @override
  Option<CounterModel> processMessage(
      CounterMessage message, CounterModel model) {
    if (message is Increment) {
      return Some(model.copyWith(count: model.count + 1));
    }
    if (message is Decrement) {
      return Some(model.copyWith(count: model.count - 1));
    }
    if (message is SetTo) {
      return Some(model.copyWith(count: message.value));
    }
    if (message is SetToAfterDelay) {
      final sideEffect = Future.delayed(
        Duration(seconds: message.seconds),
        () => [SetTo(value: message.value)],
      );

      runSideEffect(sideEffect);
      return const None();
    }

    return const None();
  }
}
