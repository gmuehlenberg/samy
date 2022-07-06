import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:bloc_mvu_app/offers_create/offers_create_message.dart';
import 'package:bloc_mvu_app/offers_create/offers_create_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class OffersCreateUpdate extends Update<OffersCreateMessage, OffersCreateModel> {
  OffersCreateUpdate(OffersCreateModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory OffersCreateUpdate.of(BuildContext context) => OffersCreateUpdate(initialOffersCreateModel);

  @override
  Option<OffersCreateModel> processMessage(OffersCreateMessage message, OffersCreateModel model) {
    if (message is SampleAction) {
      return Some(model.copyWith());
    }
    return const None();
  }
}
