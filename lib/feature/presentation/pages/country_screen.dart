import 'package:country_app/feature/presentation/widgets/countries_list_widget.dart';
import 'package:flutter/material.dart';

class MyhomePage extends StatelessWidget {
  const MyhomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Europe Countries'),
        centerTitle: true,
        actions: [],
      ),
      body: CountriesList(),
    );
  }
}
