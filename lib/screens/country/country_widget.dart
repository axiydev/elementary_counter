import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:elementary_counter/data/model/country_model.dart';
import 'package:elementary_counter/screens/country/country_widget_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryWidget extends ElementaryWidget<ICountryWidgetModel> {
  const CountryWidget(
      {super.key,
      WidgetModelFactory widgetModelFactory = createCountryWidgetModelFactory})
      : super(widgetModelFactory);

  @override
  Widget build(ICountryWidgetModel wm) {
    log("BUILDDD");
    return Scaffold(
        appBar: AppBar(
          title: const Text('country'),
        ),
        body: SafeArea(
            child: EntityStateNotifierBuilder<List<Country?>?>(
          listenableEntityState: wm.valueState,
          builder: (_, data) => ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            shrinkWrap: true,
            itemCount: data!.length,
            itemBuilder: (_, index) {
              final country = data[index];
              return SwitchListTile(
                  title: Text(country!.name ?? 'name'),
                  subtitle: Text(country.code ?? ''),
                  value: country.isSelected!,
                  onChanged: (value) =>
                      wm.selectCountry(isSelecetd: value, index: index));
            },
          ),
          errorBuilder: (_, e, ___) => Text(e.toString()),
          loadingBuilder: (_, __) =>
              const Center(child: CupertinoActivityIndicator()),
        )),
        floatingActionButton: EntityStateNotifierBuilder<List<Country?>?>(
          listenableEntityState: wm.valueState,
          errorBuilder: (_, e, ___) => Text(e.toString()),
          loadingBuilder: (_, __) => const CupertinoActivityIndicator(),
          builder: (_, data) => FloatingActionButton.extended(
              onPressed: wm.getAllCountries, label: const Text('get list')),
        ));
  }
}
