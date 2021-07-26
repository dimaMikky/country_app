import 'package:country_app/core/error/failure.dart';
import 'package:country_app/feature/domain/entities/country_entity.dart';
import 'package:country_app/feature/domain/repositories/country_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCountries {
  final CountryRepository countryRepository;

  GetAllCountries(this.countryRepository);

  Future<Either<Failure, List<CountryEntity>>> getAllCountriesFromRepo() async {
    return await countryRepository.getAllCountries();
  }
}
