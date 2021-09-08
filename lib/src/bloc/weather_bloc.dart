import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/respositories/weather_respository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherIsNotSearched());
  WeatherState get initialState => WeatherIsNotSearched();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    // TODO: implement mapEventToState
    switch (event.runtimeType) {
      case FetchWeather:
        yield WeatherIsLoading();
        try {
           WeatherModel weather = await weatherRepository.getWeather((event as FetchWeather)._city);
          yield WeatherIsLoaded(weather);
        } catch (e) {
          yield WeatherIsNotLoaded();
        }

        break;
      case ResetWeather:
        yield WeatherIsNotSearched();
    }

    // if (event is FetchWeather) {
    //   yield WeatherIsLoading();

    //   try {
    //     WeatherModel weather = await weatherRepository.getWeather(event._city);
    //     yield WeatherIsLoaded(weather);
    //   } catch (exception) {
    //     yield WeatherIsNotLoaded();
    //   }
    // } else if (event is ResetWeather) {
    //   yield WeatherIsNotSearched();
    // }
  }
}
