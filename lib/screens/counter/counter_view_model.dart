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
  late EntityStateNotifier<int> _valueController;
  CounterViewModel(super.model);
  @override
  void initWidgetModel() {
    _valueController = EntityStateNotifier<int>.value(model.counter);
    super.initWidgetModel();
  }

  @override
  Future<void> decrement() async {
    _valueController.loading();
    try {
      final newValue = await model.decrement();
      _valueController.content(newValue);
    } on Exception catch (e) {
      _valueController.error(e);
    }
  }

  @override
  Future<void> increment() async {
    _valueController.loading();
    try {
      final newValue = await model.increment();
      _valueController.content(newValue);
    } on Exception catch (e) {
      _valueController.error(e);
    }
  }

  @override
  ListenableState<EntityState<int>>? get valueState => _valueController;
}

abstract class ICounterWidgetModel extends IWidgetModel {
  ListenableState<EntityState<int>>? get valueState;
  Future<void> increment();
  Future<void> decrement();
}

class CounterErrorHandler extends ErrorHandler {
  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
    debugPrint(error.toString());
  }
}
