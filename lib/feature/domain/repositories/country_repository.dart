import 'package:country_app/core/error/failure.dart';
import 'package:country_app/feature/domain/entities/country_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<CountryEntity>>> getAllCountries();
}
