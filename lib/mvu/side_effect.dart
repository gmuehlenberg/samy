import 'dart:async';

import 'package:bloc_mvu_app/mvu/messaging.dart';

void runSideEffect(Future<Iterable<Message>> sideEffect) =>
    sideEffect.then((messages) => messages.forEach(dispatch)).catchError((Object e) {
      // TODO(tbd): log error.
    });
