import 'package:bloc_mvu_app/counter/counter_messages.dart';
import 'package:bloc_mvu_app/counter/counter_model.dart';
import 'package:bloc_mvu_app/counter/counter_update.dart';
import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:flutter/material.dart';

class CounterView extends View<CounterMessage, CounterModel, CounterUpdate> {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget buildView(CounterModel model) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Count: ${model.count}'),
          FloatingActionButton(
            onPressed: () => dispatch(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => dispatch(SetToAfterDelay(seconds: 2, value: 42)),
            tooltip: 'Set delayed to 42',
            child: const Icon(Icons.watch_later),
          ),
        ],
      );

}
