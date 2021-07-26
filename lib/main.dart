import 'package:country_app/common/app_colors.dart';
import 'package:country_app/feature/presentation/pages/country_screen.dart';
import 'locator_service.dart';
import 'locator_service.dart' as di;
import 'package:country_app/feature/presentation/bloc/country_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<GetCountriesBloc>(),
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
              backgroundColor: AppColors.mainBackground,
              scaffoldBackgroundColor: AppColors.mainBackground),
          home: MyhomePage(),
        ));
  }
}
