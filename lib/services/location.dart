import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> checkPermission() async {
    // Prüft, ob die App die Berechtigung hat, auf den Standort zuzugreifen
    LocationPermission permission = await Geolocator.checkPermission();

    // Wenn die App keine Berechtigung hat, wird der Benutzer um Erlaubnis gebeten
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
  }

  Future<void> getCurrentLocation() async {
    await checkPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
