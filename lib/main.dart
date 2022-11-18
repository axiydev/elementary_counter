import 'package:elementary_counter/screens/country/country_widget.dart';
import 'package:elementary_counter/screens/country/country_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
Created by Axmadjon Isaqov on 09:15:34 18.11.2022
© 2022 @axi_dev 
*/
/*
Theme:::Elementary MWWM
*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Provider<CounterErrorHandler>(
      //   create: (_) => CounterErrorHandler(),
      //   child: const CounterView(),
      // ),
      home: Provider<CountryErrorHandler>(
        create: (_) => CountryErrorHandler(),
        child: const CountryWidget(),
      ),
    );
  }
}
