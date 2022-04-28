class CounterModel {
  CounterModel({required this.count});

  final int count;

  CounterModel copyWith({
    int? count,
  }) => CounterModel(
      count: count ?? this.count,
    );
}

final CounterModel initialCounterModel = CounterModel(count: 0);
