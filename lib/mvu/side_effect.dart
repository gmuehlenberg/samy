import 'dart:async';
import 'package:bloc_mvu_app/logging/logging.dart';
import 'package:bloc_mvu_app/mvu/messaging.dart';

void runSideEffect(Future<Iterable<Message>> sideEffect) => sideEffect
    .then((messages) => messages.forEach(dispatch))
    // ignore: unnecessary_lambdas
    .catchError((dynamic error) => logger.e(error));
