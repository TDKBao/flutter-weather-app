import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/bloc/weather_bloc.dart';

import 'respositories/weather_respository.dart';
import 'screens/home_screen_bloc.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: Scaffold(
          body: BlocProvider(
            create: (context) => WeatherBloc(WeatherRepository()),
            child: HomeScreen(),
          ),
        ));
  }
}
