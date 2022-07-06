import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/offers/offers_message.dart';
import 'package:bloc_mvu_app/offers/offers_model.dart';
import 'package:bloc_mvu_app/offers/offers_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by 'flutter_map.dart'
import 'package:latlong2/latlong.dart'; // Recommended for most use-cases

class OffersView extends View<OffersMessage, OffersModel, OffersUpdate> {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget buildView(OffersModel model) => Scaffold(
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
                        Marker(
                          point: LatLng(51.337581, 12.378849),
                          width: 300,
                          height: 300,
                          builder: (context) => Icon(
                            Icons.location_on_sharp,
                            // color: schuleAmAddisAbebaPlatz.highlighted ? Colors.blue : Colors.black,
                            size: 40,
                          ),
                        ),
                        Marker(
                          point: schuleAmAddisAbebaPlatz.position,
                          width: 300,
                          height: 300,
                          builder: (context) {
                            final iconButton = IconButton(
                              onPressed: () {
                                dispatch(SchoolSelectedFromMap(schuleAmAddisAbebaPlatz));
                              },
                              icon: const Icon(
                                Icons.location_on_sharp,
                                size: 40,
                              ),
                            );
                            return iconButton;
                          },
                        ),
                      ],
                    ),
                  ],
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
                  itemCount: model.offersList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final component = offerComponent(offer: model.offersList[index]);
                    return component;
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
