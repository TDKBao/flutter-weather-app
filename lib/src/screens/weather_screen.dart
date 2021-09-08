import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constant.dart';
import '../models/weather_model.dart';
import '../bloc/weather_bloc.dart';

class WeatherScreen extends StatelessWidget {
  WeatherModel weather;
  final cityName;
  WeatherScreen(this.weather, this.cityName);

  @override
  Widget build(BuildContext context) {
    double cityNamePadding = 20;
    double spacingTextWeatherScreen = 10;
    double heightButtonResearchWeather = 50;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: cityNamePadding),
        child: Column(
          children: [
            Spacer(
              flex: 3,
            ),
            Text(cityName,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: Colors.white)),
            SizedBox(
              height: spacingTextWeatherScreen,
            ),
            Text(
              AppConstants.tempratureWeather,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              weather.temp.round().toString() + "F",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.amber),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      AppConstants.minTempratureWeather,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      weather.tempMin.round().toString() + "F",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.amber),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      AppConstants.maxTempratureWeather,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      weather.tempMax.round().toString() + "F",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.amber),
                    ),
                  ],
                )
              ],
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              width: double.infinity,
              height: heightButtonResearchWeather,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
                },
                child: Text(
                  AppConstants.buttonResearchWeather,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ));
  }
}
