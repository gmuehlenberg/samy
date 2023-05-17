class CreateOfferModel {
  CreateOfferModel({required this.schoolType, required this.classNo});

  final SchoolType schoolType;
  final int classNo;

  CreateOfferModel copyWith({
    required SchoolType schoolType,
    required int classNo,
  }) =>
      CreateOfferModel(
        schoolType: schoolType,
        classNo: classNo,
      );
}

final CreateOfferModel initialCreateOffersModel = CreateOfferModel(
  schoolType: SchoolType.Grundschule,
  classNo: 1,
);

// ignore: constant_identifier_names
enum SchoolType { Gymnasium, Realschule, Hauptschule, Grundschule, Berufsschule }
