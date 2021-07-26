import 'package:country_app/feature/data/models/currency_model.dart';
import 'package:country_app/feature/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  CountryModel({
    required name,
    required subregion,
    required alpha2Code,
    required flag,
    required numericCode,
    required latlng,
    required borders,
    required currencies,
  }) : super(
          name: name,
          subregion: subregion,
          alpha2Code: alpha2Code,
          flag: flag,
          numericCode: numericCode,
          latlng: latlng,
          borders: borders,
          currencies: currencies,
        );
  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'],
      subregion: json['subregion'],
      alpha2Code: json['alpha2Code'],
      flag: json['flag'],
      numericCode: json['numericCode'] != null ? json['numericCode'] : '',
      latlng: (json['latlng'] as List<dynamic>)
          .map((latlng) => latlng as double)
          .toList(),
      borders: json['borders'] != null
          ? (json['borders'] as List<dynamic>)
              .map((border) => border as String)
              .toList()
          : '',
      currencies: json['currencies'] != null
          ? CurrencyModel.fromJson((json[['currencies'][0]])[0])
          : '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subregion': subregion,
      'alpha2Code': alpha2Code,
      'flag': flag,
      'numericCode': numericCode,
      'latlng': latlng,
      'borders': borders,
      'currencies': currencies,
    };
  }
}
