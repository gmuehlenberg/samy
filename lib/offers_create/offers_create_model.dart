class OffersCreateModel {
  OffersCreateModel({
    required this.sampleVariable,
  });

  final bool sampleVariable;

  OffersCreateModel copyWith({
    bool? obscurePassword,
  }) =>
      OffersCreateModel(
        sampleVariable: sampleVariable ?? this.sampleVariable,
      );
}

final OffersCreateModel initialOffersCreateModel = OffersCreateModel(
  sampleVariable: true,
);
