import 'package:bloc_mvu_app/config/config_update.dart';
import 'package:bloc_mvu_app/mvu/messaging.dart';

abstract class ConfigMessage extends UpdateMessage{
  ConfigMessage() : super(routeTo: ConfigUpdate);
}
