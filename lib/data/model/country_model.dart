class Country {
  String? code;
  String? name;
  bool? isSelected;
  Country({required this.code, required this.name, required this.isSelected});

  Country copyWith({String? name, String? code, bool? isSelected}) => Country(
      code: code ?? this.code,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected);
}

final List<Country> countryList = [
  Country(code: 'UZ', name: 'Uzbekistan', isSelected: true),
  Country(code: 'RU', name: 'Russian', isSelected: false),
  Country(code: 'USA', name: 'United States', isSelected: false),
  Country(code: 'GB', name: 'Great Britan', isSelected: false),
  Country(code: 'AU', name: 'Australia', isSelected: false),
  Country(code: 'KZ', name: 'Kazahstan', isSelected: false),
  Country(code: 'PL', name: 'Poland', isSelected: false),
];
