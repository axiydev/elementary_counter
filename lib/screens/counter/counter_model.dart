import 'package:elementary/elementary.dart';

class CounterModel extends ElementaryModel {
  CounterModel(ErrorHandler errorHandler);
  int _count = 0;

  Future<int> increment() async {
    await Future.delayed(const Duration(seconds: 1));
    ++_count;
    return _count;
  }

  Future<int> decrement() async {
    await Future.delayed(const Duration(seconds: 1));
    --_count;
    return _count;
  }

  int get counter => _count;
}
