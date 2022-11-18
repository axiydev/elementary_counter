import 'package:elementary/elementary.dart';
import 'package:elementary_counter/screens/counter/counter_model.dart';
import 'package:elementary_counter/screens/counter/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

CounterViewModel createCounterWmFactory(BuildContext context) {
  final ErrorHandler errorHandler = context.read<CounterErrorHandler>();
  return CounterViewModel(CounterModel(errorHandler));
}

class CounterViewModel extends WidgetModel<CounterView, CounterModel>
    implements ICounterWidgetModel {
  late StateNotifier<int> _valueController;
  CounterViewModel(super.model);
  @override
  void initWidgetModel() {
    _valueController = StateNotifier<int>(initValue: model.counter);
    super.initWidgetModel();
  }

  @override
  Future<void> decrement() async {
    try {
      final newValue = await model.decrement();
      _valueController.accept(newValue);
    } on Exception {
      _valueController.accept(-1000000);
    }
  }

  @override
  Future<void> increment() async {
    try {
      final newValue = await model.increment();
      _valueController.accept(newValue);
    } on Exception {
      _valueController.accept(-100000);
    }
  }

  @override
  StateNotifier<int>? get valueState => _valueController;
}

abstract class ICounterWidgetModel extends IWidgetModel {
  StateNotifier<int>? get valueState;
  Future<void> increment();
  Future<void> decrement();
}

class CounterErrorHandler extends ErrorHandler {
  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
    debugPrint(error.toString());
  }
}
