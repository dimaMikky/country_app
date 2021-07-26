import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String name;
  final String subregion;
  final String alpha2Code;
  final String flag;
  final String numericCode;
  final List<double> latlng;
  final List<String> borders;
  final CurrencyEntity currencies;

  CountryEntity(
      {required this.name,
      required this.subregion,
      required this.alpha2Code,
      required this.flag,
      required this.numericCode,
      required this.latlng,
      required this.borders,
      required this.currencies});

  @override
  List<Object?> get props => [
        name,
        subregion,
        alpha2Code,
        flag,
        numericCode,
        latlng,
        borders,
        currencies
      ];
}

class CurrencyEntity {
  final String code;
  final String name;
  final String symbol;

  CurrencyEntity(
      {required this.code, required this.name, required this.symbol});
}
