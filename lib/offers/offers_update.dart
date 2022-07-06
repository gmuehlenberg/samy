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
      // return Some(model.copyWith(/*hier gehen neue Argumente rein */));
    }
    if (message is OfferSelectedFromList) {
      final index = model.offersList.indexWhere((offer) => offer == message.offer);
      model.offersList.replaceRange(index, index + 1, [message.offer.toggleHighlight()]);
      return Some(model.copyWith(model.offersList));
    }

    if (message is SchoolSelectedFromMap) {}
    return const None();
  }
}
