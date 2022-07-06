import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/offers/offers_model.dart';
import 'package:bloc_mvu_app/offers/offers_update.dart';

abstract class OffersMessage extends UpdateMessage {
  OffersMessage() : super(routeTo: OffersUpdate);
}

class AddOffer extends OffersMessage {}

class PlatzhalterMessage extends OffersMessage {}

class OfferSelectedFromList extends OffersMessage {
  OfferSelectedFromList(this.offer);

  final Offer offer;
}

class SchoolSelectedFromMap extends OffersMessage {
  SchoolSelectedFromMap(this.selectedSchool);

  final School selectedSchool;
}