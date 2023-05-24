import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_messages.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class CreateOfferUpdate extends Update<CreateOfferMessage, CreateOfferModel> {
  CreateOfferUpdate(CreateOfferModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory CreateOfferUpdate.of(BuildContext context) => CreateOfferUpdate(initialCreateOffersModel);

  @override
  // ignore: avoid_renaming_method_parameters
  Option<CreateOfferModel> processMessage(CreateOfferMessage msg, CreateOfferModel model) {
    if (msg is CreateOffer) {
      return Some(model.copyWith(schoolType: msg.schoolType, classNo: msg.classNo));
    }
    return const None();
  }
}
