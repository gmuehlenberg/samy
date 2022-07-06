import 'package:bloc_mvu_app/offers/offers_message.dart';
import 'package:bloc_mvu_app/user/user_model.dart';
import '../mvu/messaging.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class OffersModel {
  OffersModel({
    required this.offersList,
  });

  List<Offer> offersList;

  OffersModel copyWith(
    List<Offer>? newList,
  ) =>
      OffersModel(
        offersList: newList ?? offersList,
      );
}

// class Offer represents an created offer with all its details
class Offer {
  Offer({
    required this.offeror,
    required this.school,
    required this.schoolClass,
    required this.firstSchoolDay,
    required this.creationTime, // must be handed over as DateTime.now() when class is instantiated
    required this.highlighted,
  });

  final User offeror;
  final School school;
  final String schoolClass, firstSchoolDay;
  final DateTime creationTime;
  final bool highlighted;

  Offer toggleHighlight() => Offer(
        offeror: offeror,
        school: school,
        schoolClass: schoolClass,
        firstSchoolDay: firstSchoolDay,
        creationTime: creationTime,
        highlighted: !highlighted,
      );

  int timeSinceCreation() {
    final now = DateTime.now();
    return now.difference(creationTime).inMinutes;
  }
}

class School {
  School({
    required this.name,
    required this.street,
    required this.streetNumber,
    required this.postCode,
    required this.city,
    required this.district,
    required this.position,
    required this.telephone,
    required this.type,
    required this.picture,
  });

  final String name, street, streetNumber, postCode, city, district, telephone, type, picture;
  final LatLng position;
}

// offerComponent() is required to build list items for ListView.builder in offers_view.dart
Widget offerComponent({required Offer offer}) => InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: offer.highlighted ? Colors.blue : Colors.white,
          boxShadow: [
            BoxShadow(
              color: offer.highlighted ? Colors.black.withOpacity(1) : Colors.grey.withOpacity(0.2),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(offer.school.picture),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              offer.school.name,
                              style: TextStyle(
                                color: offer.highlighted ? Colors.white : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              offer.school.district,
                              style: TextStyle(
                                color: offer.highlighted ? Colors.white : Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                /*GestureDetector(
              onTap: () {
                setState(() {
                  job.isMyFav = !job.isMyFav;
                });
              },
              child: AnimatedContainer(
                  height: 35,
                  padding: EdgeInsets.all(5),
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: job.isMyFav ? Colors.red.shade100 : Colors.grey.shade300,)
                  ),
                  child: Center(
                      child: job.isMyFav ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_outline, color: Colors.grey.shade600,)
                  )
              ),
            )*/
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200,
                      ),
                      child: Text(
                        offer.schoolClass,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200,
                      ),
                      child: Text(
                        offer.firstSchoolDay,
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
                Text(
                  '${offer.timeSinceCreation()} minutes ago',
                  style: TextStyle(color: offer.highlighted ? Colors.white : Colors.grey.shade800, fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        dispatch(OfferSelectedFromList(offer));
      },
    );

// initialOffer is used as placeholder during development time
Offer initialOffer = Offer(
  offeror: initialUser,
  school: schuleAmAddisAbebaPlatz,
  schoolClass: '1. Klasse',
  firstSchoolDay: '01.09.2022',
  creationTime: DateTime.now(),
  highlighted: false,
);

Offer initialOffer2 = Offer(
  offeror: initialUser,
  school: grundschuleBernhardGoeringStrasse,
  schoolClass: '2. Klasse',
  firstSchoolDay: '10.09.2022',
  creationTime: DateTime.now(),
  highlighted: false,
);

// initialOffersModel is used as placeholder during development time
final OffersModel initialOffersModel = OffersModel(
  offersList: [initialOffer, initialOffer, initialOffer, initialOffer2],
);

// List of sample schools in Leipzig with details
School schuleAmAddisAbebaPlatz = School(
    name: 'Schule am Addis-Abeba-Platz',
    street: 'Addis-Abeba-Platz',
    streetNumber: '1',
    postCode: '04103',
    city: 'Leipzig',
    district: 'Zentrum-Südost',
    position: LatLng(51.333871, 12.379632),
    telephone: '034130859780',
    type: 'Grundschule',
    picture: 'assets/pic_schuleAmAddisAbebaPlatz.jpg');

School schuleAmFlossplatz = School(
    name: 'Schule am Floßplatz',
    street: 'Hohe Straße',
    streetNumber: '45',
    postCode: '04107',
    city: 'Leipzig',
    district: 'Zentrum-Süd',
    position: LatLng(51.3296509, 12.3720827),
    telephone: '034126178680',
    type: 'Grundschule',
    picture: 'assets/pic_schuleAmFlossplatz.jpg');

School grundschuleWilhelmBusch = School(
    name: 'Grundschule Wilhelm-Busch',
    street: 'Heinrichstraße',
    streetNumber: '43',
    postCode: '04317',
    city: 'Leipzig',
    district: 'Detroitnitz',
    position: LatLng(51.3360745, 12.4005866),
    telephone: '03416493325',
    type: 'Grundschule',
    picture: 'assets/pic_grundschuleWilhelmBusch.jpg');

School pabloNerudaSchule = School(
    name: 'Pablo-Neruda-Schule',
    street: 'Tarostraße',
    streetNumber: '6',
    postCode: '04103',
    city: 'Leipzig',
    district: 'Zentrum-Südost',
    position: LatLng(51.3258315, 12.384723),
    telephone: '03411245890',
    type: 'Grundschule',
    picture: 'assets/pic_pabloNerudaSchule.jpg');

School fritzBaumgartenSchule = School(
    name: 'Fritz-Baumgarten-Schule',
    street: 'Riebeckstraße',
    streetNumber: '50',
    postCode: '04317',
    city: 'Leipzig',
    district: 'Thonberg',
    position: LatLng(51.3265687, 12.4022076),
    telephone: '03412308980',
    type: 'Grundschule',
    picture: 'assets/pic_fritzBaumgartenSchule.jpg');

School grundschuleBernhardGoeringStrasse = School(
    name: 'Grundschule an der Bernhard-Göring-Straße',
    street: 'Bernhard-Göring-Straße',
    streetNumber: '107',
    postCode: '04275',
    city: 'Leipzig',
    district: 'Südvorstadt',
    position: LatLng(51.3182725, 12.3768613),
    telephone: '034122537200',
    type: 'Grundschule',
    picture: 'assets/pic_grundschuleBernhardGoeringStrasse.jpg');

School grundschuleThomanum = School(
    name: 'Grundschule thomanum',
    street: 'Sebastian-Bach-Straße',
    streetNumber: '1',
    postCode: '04109',
    city: 'Leipzig',
    district: 'Zentrum-West',
    position: LatLng(51.3366427, 12.3613236),
    telephone: '034197434421',
    type: 'Grundschule',
    picture: 'assets/pic_grundschuleThomanum.jpg');
