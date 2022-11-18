import 'package:elementary/elementary.dart';
import 'package:elementary_counter/screens/counter/counter_view_model.dart';
import 'package:flutter/material.dart';

class CounterView extends ElementaryWidget<ICounterWidgetModel> {
  const CounterView(
      {super.key,
      WidgetModelFactory widgetModelFactory = createCounterWmFactory})
      : super(widgetModelFactory);

  @override
  Widget build(ICounterWidgetModel wm) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StateNotifierBuilder<int>(
            listenableState: wm.valueState!,
            builder: (_, data) => _MyTextView(title: data.toString()),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          StateNotifierBuilder<int>(
            listenableState: wm.valueState!,
            builder: (_, data) => FloatingActionButton(
              heroTag: '1',
              onPressed: wm.increment,
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          StateNotifierBuilder(
            listenableState: wm.valueState!,
            builder: (_, data) => FloatingActionButton(
              heroTag: '3',
              onPressed: wm.decrement,
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _MyTextView extends StatelessWidget {
  const _MyTextView({required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.w700, color: Colors.blue),
    );
  }
}
