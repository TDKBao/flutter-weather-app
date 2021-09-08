
class WeatherModel {
  final temp;
  final tempMax;
  final tempMin;

  WeatherModel(
      this.temp, this.tempMax, this.tempMin);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      json["temp"],
      json["temp_min"],
      json["temp_max"],
    );
  }
}
