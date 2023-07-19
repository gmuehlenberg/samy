import 'package:samy_app/mvu/update.dart';
import 'package:samy_app/offers/offers_message.dart';
import 'package:samy_app/offers/offers_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class OffersUpdate extends Update<OffersMessage, OffersModel> {
  OffersUpdate(OffersModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory OffersUpdate.of(BuildContext context) => OffersUpdate(initialOffersModel);

  @override
  Option<OffersModel> processMessage(OffersMessage message, OffersModel model) {
    if (message is AddOffer) {
      return const None();
    }
    
    if (message is SchoolSelectedFromMap) {
      return Some(model.copyWith(selectedSchool: Some(message.selectedSchool)));
    }

    if (message is OfferSelectedFromList) {
      final index = model.offersList.indexWhere((offer) => offer == message.offer);
      model.offersList.replaceRange(index, index + 1, [message.offer.toggleHighlight()]);
      return Some(model.copyWith(newList: model.offersList));
    }

    if (message is GetAllOffers) {
      return Some(model.copyWith(newList: model.offersList));
    }

    return const None();
  }
}
