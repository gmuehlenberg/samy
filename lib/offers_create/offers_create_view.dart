import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/offers_create/offers_create_message.dart';
import 'package:bloc_mvu_app/offers_create/offers_create_model.dart';
import 'package:bloc_mvu_app/offers_create/offers_create_update.dart';
import 'package:flutter/material.dart';

class OffersCreateView extends View<OffersCreateMessage, OffersCreateModel, OffersCreateUpdate> {
  const OffersCreateView({Key? key}) : super(key: key);

  @override
  Widget buildView(OffersCreateModel model) => const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: CustomScrollView(),
          ),
        ),
      );
}
