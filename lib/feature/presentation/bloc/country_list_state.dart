import 'package:country_app/feature/domain/entities/country_entity.dart';
import 'package:equatable/equatable.dart';

abstract class GetCountriesState extends Equatable {
  const GetCountriesState();

  @override
  List<Object?> get props => [];
}

class CountriesEmpty extends GetCountriesState {}

class CountriesLoading extends GetCountriesState {}

class CountriesLoaded extends GetCountriesState {
  final List<CountryEntity> countriesList;

  CountriesLoaded({required this.countriesList});

  @override
  List<Object?> get props => [countriesList];
}

class CountriesLoadingError extends GetCountriesState {
  final String message;

  CountriesLoadingError({required this.message});
}
