//Not yet implemented

class OffersCreateModel {
  OffersCreateModel({
    required this.sampleVariable,
  });

  final bool sampleVariable;

  OffersCreateModel copyWith({
    bool? obscurePassword,
  }) =>
      OffersCreateModel(
        sampleVariable: sampleVariable,
      );
}

final OffersCreateModel initialOffersCreateModel = OffersCreateModel(
  sampleVariable: true,
);
