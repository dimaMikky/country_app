import 'package:country_app/feature/presentation/widgets/map_widget.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  final latlng;
  final numericCode;
  final borders;
  final currencies;

  const SecondRoute(
      {Key? key,
      required this.latlng,
      required this.numericCode,
      required this.borders,
      required this.currencies})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _latitude = latlng[0];
    final _longitude = latlng[1];
    final detailedCurrencies =
        '${currencies.code} - ${currencies.symbol} - ${currencies.name}';
    return Scaffold(
      appBar: AppBar(
        title: Text("Map Location"),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: MapWidget(
              latitude: _latitude,
              longitude: _longitude,
            )),
            SizedBox(height: 2),
            Center(
              child: Text('Numeric Code: $numericCode'),
            ),
            SizedBox(height: 2),
            Center(
              child:
                  Text('Borders: ${borders.isEmpty ? 'No borders' : borders}'),
            ),
            SizedBox(height: 2),
            Center(
              child: Text(
                  'Currencies: ${currencies != null ? detailedCurrencies : 'No currencies'}'),
            ),
            SizedBox(height: 4),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
            ),
            SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}
