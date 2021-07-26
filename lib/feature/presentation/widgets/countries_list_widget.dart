import 'dart:async';
import 'package:country_app/feature/domain/entities/country_entity.dart';
import 'package:country_app/feature/presentation/bloc/country_list_bloc.dart';
import 'package:country_app/feature/presentation/bloc/country_list_event.dart';
import 'package:country_app/feature/presentation/bloc/country_list_state.dart';
import 'package:country_app/feature/presentation/widgets/country_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesList extends StatefulWidget {
  CountriesList({Key? key}) : super(key: key);

  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  final scrollController = ScrollController();
  List<CountryEntity> mainCountries = [];
  List<CountryEntity> countries = [];
  List<CountryEntity> filteredCountries = [];
  void setupScrollController(BuildContext context) {
    BlocProvider.of<GetCountriesBloc>(context);
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<GetCountriesBloc>(context);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return BlocBuilder<GetCountriesBloc, GetCountriesState>(
      builder: (context, state) {
        bool isLoading = false;
        if (state is CountriesEmpty) {
          BlocProvider.of<GetCountriesBloc>(context).add(GetCountries());
        } else if (state is CountriesLoading) {
          return _loadingIndicator();
        } else if (state is CountriesLoaded) {
          mainCountries = state.countriesList;
          if (filteredCountries.isNotEmpty) {
            countries = filteredCountries;
          } else
            countries = state.countriesList;
        } else if (state is CountriesLoadingError) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    state.message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Center(
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      BlocProvider.of<GetCountriesBloc>(context)
                          .add(GetCountries());
                    },
                    label: const Text('Try again'),
                    icon: const Icon(Icons.replay),
                    backgroundColor: Colors.green,
                  ),
                )
              ],
            ),
          );
        }
        return Column(
          children: [
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Filter by name',
              ),
              onChanged: (string) {
                setState(() {
                  if (string.length >= 3) {
                    filteredCountries = mainCountries
                        .where((c) => (c.name
                            .toLowerCase()
                            .contains(string.toLowerCase())))
                        .toList();
                  } else if (string.length == 0) {
                    filteredCountries = mainCountries;
                  }
                });
              },
            ),
            Expanded(
              child: SizedBox(
                child: ListView.separated(
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    if (index < countries.length) {
                      return Dismissible(
                        child: CountryCard(
                          country: countries[index],
                        ),
                        key: ValueKey<CountryEntity>(countries[index]),
                        onDismissed: (DismissDirection direction) {
                          setState(() {
                            countries.removeAt(index);
                          });
                        },
                      );
                    } else {
                      Timer(Duration(microseconds: 300), () {
                        scrollController
                            .jumpTo(scrollController.position.maxScrollExtent);
                      });
                      return _loadingIndicator();
                    }
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey[400],
                    );
                  },
                  itemCount: countries.length + (isLoading ? 1 : 0),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _loadingIndicator() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
