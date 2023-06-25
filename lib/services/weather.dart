class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getWeatherImage(int condition) {
    if (condition < 300) {
      return 'assets/images/thunderstorm.png';
    } else if (condition < 400) {
      return 'assets/images/rainy_city.png';
    } else if (condition < 600) {
      return 'assets/images/shower.png';
    } else if (condition < 700) {
      return 'assets/images/snowy.png';
    } else if (condition < 800) {
      return 'assets/images/foggy.png';
    } else if (condition == 800) {
      return 'assets/images/sunny.png';
    } else if (condition <= 804) {
      return 'assets/images/cloudy.png';
    } else {
      return 'assets/images/froggy.png';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Warm genug um 🍦 zu essen';
    } else if (temp > 20) {
      return 'Zeit für kurze Hosen und 👕';
    } else if (temp < 10) {
      return 'Du brauchst 🧣 und 🧤';
    } else {
      return 'Nimm eine 🧥 mit. Nur für alle Fälle.';
    }
  }
}
