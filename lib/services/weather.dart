import 'package:climaone/services/location.dart';
import 'package:climaone/services/networking.dart';

const appID = 'a8e497314826310d7bb3f5b351e2b9f6';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

// api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

class WeatherModel {
  Future<dynamic> getCurrentLocation(String cityName) async {
    var url = '$openWeatherMapUrl?q=$cityName&appid=$appID&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url);

    var cityData = await networkHelper.getData();
    return cityData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = await Location();
    await loc.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${loc.latitude}&lon=${loc.longitude}&appid=$appID&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
