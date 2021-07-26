import 'package:country_app/feature/domain/entities/country_entity.dart';

class CurrencyModel extends CurrencyEntity {
  CurrencyModel({
    required code,
    required name,
    required symbol,
  }) : super(
          code: code,
          name: name,
          symbol: symbol,
        );

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      code: json['code'] != null ? json['code'] : '',
      name: json['name'] != null ? json['name'] : '',
      symbol: json['symbol'] != null ? json['symbol'] : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'symbol': symbol,
    };
  }
}
