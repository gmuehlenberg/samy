import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/offers/offers_message.dart';
import 'package:bloc_mvu_app/offers/offers_model.dart';
import 'package:bloc_mvu_app/offers/offers_update.dart';
import 'package:flutter/material.dart';

class OffersView extends View<OffersMessage, OffersModel, OffersUpdate> {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget buildView(OffersModel model) => Scaffold(
        body: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: model.offersList.length,
            itemBuilder: (BuildContext context, int index) {
              //hier müsste statt model eigentlich ein BuildContext context rein.
              final component = offerComponent(offer: model.offersList[index]);
              return component;
            },
          ),
        ),
      );
}
