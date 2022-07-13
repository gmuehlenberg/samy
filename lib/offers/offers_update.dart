import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:bloc_mvu_app/offers/offers_message.dart';
import 'package:bloc_mvu_app/offers/offers_model.dart';
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
      final relatedOffers = <Offer>[];
      var i = 0;

      while (i < model.offersList.length) {
        final currentOffer = model.offersList[i];
        if (currentOffer.school.name == message.selectedSchool.name) {
          relatedOffers.add(currentOffer);
        }
        i++;
      }
      return Some(model.copyWith(relatedOffers));
    }

    if (message is OfferSelectedFromList) {
      final index = model.offersList.indexWhere((offer) => offer == message.offer);
      model.offersList.replaceRange(index, index + 1, [message.offer.toggleHighlight()]);
      return Some(model.copyWith(model.offersList));
    }

    return const None();
  }
}
