import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/mvu/view.dart';
import 'package:samy_app/offers/offers_message.dart';
import 'package:samy_app/offers/offers_model.dart';
import 'package:samy_app/offers/offers_update.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by 'flutter_map.dart'
import 'package:latlong2/latlong.dart'; // Recommended for most use-cases

class OffersView extends View<OffersMessage, OffersModel, OffersUpdate> {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget buildView(OffersModel model) {
    final offers = model.selectedSchool.fold(() => model.offersList, (selectedSchool) {
      final relatedOffers = <Offer>[];
      var i = 0;

      while (i < model.offersList.length) {
        final currentOffer = model.offersList[i];
        if (currentOffer.school.name == selectedSchool.name) {
          relatedOffers.add(currentOffer);
        }
        i++;
      }
      return relatedOffers;
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(51.337581, 12.378849),
                  // ignore: avoid_redundant_argument_values
                  zoom: 13,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: 'https://{s}.tile.openstreetmap.de/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayerOptions(
                    markers: [
                      schoolMarker(model, schuleAmAddisAbebaPlatz),
                      schoolMarker(model, schuleAmFlossplatz),
                      schoolMarker(model, fritzBaumgartenSchule),
                      schoolMarker(model, grundschuleBernhardGoeringStrasse),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Name of school',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: searchSchool,
              ),
            ),
            Expanded(
              // ignore: avoid_redundant_argument_values
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 8,
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: offers.length,
                itemBuilder: (BuildContext context, int index) {
                  final component = offerComponent(offer: offers[index]);
                  return component;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Marker schoolMarker(OffersModel model, School school) => Marker(
        point: school.position,
        width: 45,
        height: 45,
        builder: (context) {
          final iconButton = IconButton(
            onPressed: () {
              dispatch(SchoolSelectedFromMap(school));
            },
            icon: Icon(
              Icons.location_on_sharp,
              size: 60,
              color: model.selectedSchool.fold(() => Colors.black, (selectedSchool) => selectedSchool == school ? Colors.blue : Colors.black),
            ),
          );
          return iconButton;
        },
      );

  void searchSchool(String query) {
  }
}
