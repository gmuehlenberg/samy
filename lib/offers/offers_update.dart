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
    if (message is PlatzhalterMessage) {
      // Action goes here. Platzhalter.
    }
    return const None();
  }
}
