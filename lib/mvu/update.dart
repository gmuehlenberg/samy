import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:dartz/dartz.dart';

/// Allows to describe business logic without mutations
/// or side effects other than dispatching [MSG] and [MDL] replacements.
abstract class Update<MSG extends UpdateMessage, MDL> extends Bloc<MSG, MDL> {
  Update(MDL initialModel) : super(initialModel) {
    // register message observer
    on<MSG>(onMessage);

    // register update for routing
    _registerUpdate<MSG>(this);
  }

  // We use [void] instead of [FutureOr<void>] as return type
  // because side-effects should not be executed here
  void onMessage(MSG message, Emitter<MDL> replaceModel) {
    final oldModel = state;
    final newModel = processMessage(message, oldModel);

    if (newModel is Some<MDL>) {
      replaceModel(newModel.value);
    }
  }

  /// Overrides of this methods describe the actual business logic.
  /// Returning [Some] means the model was updated and its view needs to be rendered.
  /// Return [None] if only side-effects were triggered.
  Option<MDL> processMessage(MSG message, MDL model);

  /// Convenience method to keep MVU terminology
  MDL model() => state;
}

// impure code for the framework only, not accessible from outside this file
final Map<Type, Update> _updateByType = {};
final UnmodifiableMapView<Type, Update> updateByType =
    UnmodifiableMapView(_updateByType);

void _registerUpdate<MSG extends UpdateMessage>(Update update) {
  if (_updateByType.containsKey(update.runtimeType)) {
    // This will be checked only once at application start and acts as a developer hint
    throw Exception(
        'A subtype of Update like ${update.runtimeType} can only be instantiated once!');
  }
  _updateByType[update.runtimeType] = update;
}
