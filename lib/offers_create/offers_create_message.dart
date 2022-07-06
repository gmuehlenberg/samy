import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/offers_create/offers_create_update.dart';

abstract class OffersCreateMessage extends UpdateMessage {
  OffersCreateMessage() : super(routeTo: OffersCreateUpdate);
}

class SampleAction extends OffersCreateMessage {}
