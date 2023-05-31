import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/offers_create/create_offer_model.dart';
import 'package:samy_app/offers_create/create_offer_update.dart';

abstract class CreateOfferMessage extends UpdateMessage {
  CreateOfferMessage() : super(routeTo: CreateOfferUpdate);
}

class CreateOffer extends CreateOfferMessage {
  CreateOffer({required this.schoolType, required this.classNo, required this.schoolName});

  final SchoolType schoolType;
  final int classNo;
  final SchoolName schoolName;
}
