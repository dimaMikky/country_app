import 'package:country_app/common/app_colors.dart';
import 'package:country_app/feature/domain/entities/country_entity.dart';
import 'package:country_app/feature/presentation/pages/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryCard extends StatelessWidget {
  final CountryEntity country;
  const CountryCard({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SecondRoute(
                  latlng: country.latlng,
                  borders: country.borders,
                  currencies: country.currencies,
                  numericCode: country.numericCode)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.cellBackground,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              width: 166,
              height: 166,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.network(
                  country.flag,
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Text(
                    country.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${country.subregion} - ${country.alpha2Code}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Country currencies:',
                    style: TextStyle(
                      color: AppColors.greyColor,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${country.currencies.code} - ${country.currencies.name} - ${country.currencies.symbol}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Country Numeric code:',
                    style: TextStyle(color: AppColors.greyColor),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    country.numericCode,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
