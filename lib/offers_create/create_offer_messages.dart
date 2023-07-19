import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/offers_create/create_offer_update.dart';

abstract class CreateOfferMessage extends UpdateMessage {
  CreateOfferMessage() : super(routeTo: CreateOfferUpdate);
}

class CreateOffer extends CreateOfferMessage {
  CreateOffer({required this.classNumber, required this.firstSchoolday, required this.schoolId});

  final int classNumber;
  final String firstSchoolday;
  final String schoolId;

}
