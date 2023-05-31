import 'dart:async';

import 'package:samy_app/logging/logging.dart';
import 'package:samy_app/mvu/messaging.dart';

void runSideEffect(Future<Iterable<Message>> sideEffect) => sideEffect
    .then((messages) => messages.forEach(dispatch))
    // ignore: unnecessary_lambdas
    .catchError((dynamic error) => logger.e(error));
