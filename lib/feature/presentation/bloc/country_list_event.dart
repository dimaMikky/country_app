import 'package:equatable/equatable.dart';

abstract class GetCountriesEvent extends Equatable {
  const GetCountriesEvent();

  @override
  List<Object?> get props => [];
}

class GetCountries extends GetCountriesEvent {}
