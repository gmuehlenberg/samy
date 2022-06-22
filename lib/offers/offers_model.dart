import 'package:bloc_mvu_app/user/user_model.dart';
import 'package:flutter/material.dart';

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

final OffersModel initialOffersModel = OffersModel(
  offersList: [initialOffer, initialOffer], // wie diese Liste korrekt übergeben?
);

class Offer {
  Offer({
    required this.offeror,
    required this.schoolName,
    required this.schoolDistrict,
    required this.schoolClass,
    required this.firstSchoolDay,
    required this.creationTime, // must be handed over as DateTime.now() when class is instantiated
  });

  final String schoolName, schoolDistrict, schoolClass, firstSchoolDay;
  final User offeror;
  final DateTime creationTime;

  int timeSinceCreation() {
    final now = DateTime.now();
    return now.difference(creationTime).inMinutes;
  }
}

Widget offerComponent({required Offer offer}) => Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
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
                        child: Image.asset(offer.offeror.image),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer.schoolName,
                            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(offer.schoolDistrict, style: TextStyle(color: Colors.grey[500])),
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
                style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );

Offer initialOffer = Offer(
  offeror: initialUser,
  schoolName: 'Grundschule Leipzig',
  schoolDistrict: 'Südvorstadt',
  schoolClass: '1. Klasse',
  firstSchoolDay: '01.09.2022',
  creationTime: DateTime.now(),
);
