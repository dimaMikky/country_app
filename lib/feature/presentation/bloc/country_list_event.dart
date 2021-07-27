import 'package:equatable/equatable.dart';

abstract class GetCountriesEvent extends Equatable {
  const GetCountriesEvent();

  @override
  List<Object?> get props => [];
}

class GetCountries extends GetCountriesEvent {}

class GetFilteredCountries extends GetCountriesEvent {
  final String countryString;

  GetFilteredCountries({required this.countryString});

  @override
  List<Object> get props => [countryString];
}
