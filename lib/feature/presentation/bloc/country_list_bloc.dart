import 'package:country_app/core/error/failure.dart';
import 'package:country_app/feature/domain/usecases/get_all_countries.dart';
import 'package:country_app/feature/presentation/bloc/country_list_event.dart';
import 'package:country_app/feature/presentation/bloc/country_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCountriesBloc extends Bloc<GetCountriesEvent, GetCountriesState> {
  final GetAllCountries getAllCountries;
  GetCountriesBloc({required this.getAllCountries}) : super(CountriesEmpty());

  @override
  Stream<GetCountriesState> mapEventToState(GetCountriesEvent event) async* {
    if (event is GetCountries) {
      yield CountriesLoading();
      final failureOrCountry = await getAllCountries.getAllCountriesFromRepo();
      yield failureOrCountry.fold(
          (failure) =>
              CountriesLoadingError(message: _mapFailureToMessage(failure)),
          (country) => CountriesLoaded(countriesList: country));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
