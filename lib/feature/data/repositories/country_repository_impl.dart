import 'package:country_app/core/error/exception.dart';
import 'package:country_app/feature/data/datasources/country_remote_datasource.dart';
import 'package:country_app/feature/domain/entities/country_entity.dart';
import 'package:country_app/core/error/failure.dart';
import 'package:country_app/feature/domain/repositories/country_repository.dart';
import 'package:dartz/dartz.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource countryRemoteDataSource;

  CountryRepositoryImpl({required this.countryRemoteDataSource});
  @override
  Future<Either<Failure, List<CountryEntity>>> getAllCountries() async {
    try {
      final remoteCountry = await countryRemoteDataSource.getAllCountries();
      return Right(remoteCountry);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
