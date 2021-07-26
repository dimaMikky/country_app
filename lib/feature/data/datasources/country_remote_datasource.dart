import 'dart:convert';

import 'package:country_app/core/error/exception.dart';
import 'package:country_app/feature/data/models/country_model.dart';
import 'package:http/http.dart' as http;

const URL = 'https://restcountries.eu/rest/v2/region/europe';

abstract class CountryRemoteDataSource {
  /// Calls the 'https://restcountries.eu/rest/v2/region/europe' endpoint
  ///
  /// Throws a [ServerException] for all error code
  Future<List<CountryModel>> getAllCountries();
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final http.Client client;

  CountryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CountryModel>> getAllCountries() async {
    final response = await client
        .get(Uri.parse(URL), headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {
      final countries = json.decode(response.body);
      return (countries as List)
          .map((country) => CountryModel.fromJson(country))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
