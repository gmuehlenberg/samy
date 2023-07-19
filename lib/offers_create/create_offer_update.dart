import 'dart:convert';
import 'package:samy_app/mvu/update.dart';
import 'package:samy_app/offers_create/create_offer_messages.dart';
import 'package:samy_app/offers_create/create_offer_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:samy_app/user/user_model.dart';

class CreateOfferUpdate extends Update<CreateOfferMessage, CreateOfferModel> {
  CreateOfferUpdate(CreateOfferModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory CreateOfferUpdate.of(BuildContext context) => CreateOfferUpdate(initialCreateOffersModel);

  @override
  // ignore: avoid_renaming_method_parameters
  Option<CreateOfferModel> processMessage(CreateOfferMessage msg, CreateOfferModel model) {
    if (msg is CreateOffer) {
      return Some(model.copyWith());
    }
    return const None();
  }
}
Future<Offer> addOfferToBackend(Offer offer, User user) async {
  final localUrl = Uri.parse('http://localhost:3000/offers');

  final response = await http.post(
      localUrl,
      headers: {'Content-Type': 'application/json', 'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDY0ZDhkN2M4ZTNkM2I1YzEyNjU2ZTciLCJpYXQiOjE2ODQzMzA3MTEsImV4cCI6MTY4NDQxNzExMX0.CyT913nzztrBH9fOaL3f3mzAz94qGKDzgFg6pMTmIPw'},
      body: json.encode({
        'userId': user.id,
        'schoolId': offer.schoolId,
        'classNo': offer.classNumber,
        'firstSchoolDay': offer.firstSchoolDay
      }),
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return Offer.fromJSON(jsonDecode(response.body) as Map<String, dynamic>); // data noch editieren!
}

