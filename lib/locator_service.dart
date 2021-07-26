import 'package:country_app/feature/data/datasources/country_remote_datasource.dart';
import 'package:country_app/feature/data/repositories/country_repository_impl.dart';
import 'package:country_app/feature/domain/repositories/country_repository.dart';
import 'package:country_app/feature/domain/usecases/get_all_countries.dart';
import 'package:country_app/feature/presentation/bloc/country_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //bloc/cubit
  sl.registerFactory(() => GetCountriesBloc(getAllCountries: sl()));

  //useCases
  sl.registerLazySingleton(() => GetAllCountries(sl()));

  //Repository
  sl.registerLazySingleton<CountryRepository>(() => CountryRepositoryImpl(
        countryRemoteDataSource: sl(),
      ));
  sl.registerLazySingleton<CountryRemoteDataSource>(
      () => CountryRemoteDataSourceImpl(client: http.Client()));

  // External
  sl.registerLazySingleton(() => http.Client());
}
