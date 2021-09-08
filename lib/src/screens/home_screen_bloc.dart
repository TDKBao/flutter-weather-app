import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../constants/constant.dart';
import '../screens/weather_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      double spacingTextWeatherScreen = 10;

    var cityController = TextEditingController();
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherIsNotSearched) {
            return Stack(
              children: [
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacingTextWeatherScreen),
                    child: Column(
                      children: [
                        Spacer(
                          flex: 3,
                        ),
                        Text(
                          AppConstants.titleSearchWeather,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.white),
                        ),
                        Spacer(),
                        TextFormField(
                          controller: cityController,
                          decoration: InputDecoration(
                            filled: true,
                            // fillColor: Color(0xFF1C2341),
                            hintText: AppConstants.textFieldSearchCity,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                              onPressed: () {
                                weatherBloc
                                    .add(FetchWeather(cityController.text));
                              },
                              child: Text(AppConstants.buttonSeachWeather,
                                  style: Theme.of(context).textTheme.button)),
                        ),
                        Spacer(
                          flex: 2,
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          } else if (state is WeatherIsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherIsLoaded) {
            return WeatherScreen(state.getWeather, cityController.text);
          } else {
            return Text(
              "Error",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: Colors.white),
            );
          }
        },
      ),
    );
  }
}
