import 'package:elementary/elementary.dart';
import 'package:elementary_counter/data/model/country_model.dart';
import 'package:elementary_counter/screens/country/country_model.dart';
import 'package:elementary_counter/screens/country/country_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

CountryWidgetModel createCountryWidgetModelFactory(BuildContext context) {
  final errorHandler = context.read<CountryErrorHandler>();
  return CountryWidgetModel(CountryModel(errorHandler));
}

class CountryWidgetModel extends WidgetModel<CountryWidget, CountryModel>
    implements ICountryWidgetModel {
  CountryWidgetModel(super.model);

  late EntityStateNotifier<List<Country?>?> _valueController;
  @override
  void initWidgetModel() {
    _valueController =
        EntityStateNotifier<List<Country?>?>.value(model.countries);
    super.initWidgetModel();
  }

  @override
  Future<void> getAllCountries() async {
    _valueController.loading();
    try {
      final countries = await model.getCountries();
      _valueController.content(countries!);
    } on Exception catch (e) {
      _valueController.error(e);
    }
  }

  @override
  ListenableState<EntityState<List<Country?>?>> get valueState =>
      _valueController;

  @override
  Future<void> selectCountry(
      {required bool? isSelecetd, required int? index}) async {
    // _valueController.loading();  //create loading
    try {
      final countrLt =
          await model.selectCountries(isSelected: isSelecetd!, index: index!);
      _valueController.content(countrLt);
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      _valueController.notifyListeners();
    } on Exception catch (e) {
      _valueController.error(e);
    }
  }

  @override
  Future<void> deleteCountryByCode({required String code}) async {
    _valueController.loading();
    try {
      final data = await model.deleteCountryById(code: code);
      _valueController.content(data);
    } on Exception catch (e) {
      _valueController.error(e);
    }
  }
}

abstract class ICountryWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<Country?>?>> get valueState;

  Future<void> getAllCountries();
  Future<void> deleteCountryByCode({required String code});
  Future<void> selectCountry({required bool? isSelecetd, required int? index});
}

class CountryErrorHandler extends ErrorHandler {
  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
    debugPrint(error.toString());
  }
}
