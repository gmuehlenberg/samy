import 'package:samy_app/config/config_update.dart';
import 'package:samy_app/mvu/messaging.dart';

abstract class ConfigMessage extends UpdateMessage {
  ConfigMessage() : super(routeTo: ConfigUpdate);
}
