import 'package:elementary/elementary.dart';
import 'package:elementary_counter/data/model/country_model.dart';

class CountryModel extends ElementaryModel {
  CountryModel(ErrorHandler errorHandler);
  final List<Country?> _countryList = List.empty(growable: true);

  Future<List<Country?>?> getCountries() async {
    await Future.delayed(const Duration(seconds: 1));
    _countryList.addAll(countryList);
    return _countryList;
  }

  Future<List<Country?>?> selectCountries(
      {required bool isSelected, required int index}) async {
    await Future.delayed(const Duration(seconds: 1));

    _countryList.clear();
    countryList[index].isSelected = isSelected;
    _countryList.addAll(countryList);
    return _countryList;
  }

  List<Country?>? get countries => _countryList;
}
