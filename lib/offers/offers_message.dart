import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/offers/offers_model.dart';
import 'package:bloc_mvu_app/offers/offers_update.dart';

abstract class OffersMessage extends UpdateMessage {
  OffersMessage() : super(routeTo: OffersUpdate);
}

class OfferSelectedFromList extends OffersMessage {
  OfferSelectedFromList(this.offer);

  final Offer offer;
}

class GetAllOffers extends OffersMessage {}

class SchoolSelectedFromMap extends OffersMessage {
  SchoolSelectedFromMap(this.selectedSchool);

  final School selectedSchool;
}

class AddOffer extends OffersMessage {}
