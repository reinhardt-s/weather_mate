// Importiert die Flutter Material Bibliothek
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:video_player/video_player.dart';

import '../services/location.dart';
import 'package:http/http.dart' as http;

import '../services/networking.dart';
import '../utilities/constants.dart';
import 'location_screen.dart';

// Definiert das StatefulWidget LoadingScreen
class LoadingScreen extends StatefulWidget {
  @override
  // Erzeugt den Status für das StatefulWidget
  _LoadingScreenState createState() => _LoadingScreenState();
}

// Definiert die Klasse _LoadingScreenState, die den Status für das StatefulWidget verwaltet
class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/welcome.mp4')
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
    getWeatherDataForLocation();
  }

  void getWeatherDataForLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    try {
      WeatherApi weatherApi = WeatherApi(
          'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&lang=de&units=metric&appid=${kApiKey}');
      var weatherData = await weatherApi.getWeatherData();
      double temp = weatherData['main']['temp'];
      int condition = weatherData['weather'][0]['id'];
      String city = weatherData['name'];
      String description = weatherData['weather'][0]['description'];
      print('Temperatur: $temp');
      print('Wetterlage: $condition');
      print('Stadt: $city');
      print('Beschreibung: $description');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(
            weatherData: weatherData,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  // Überschreibt die Methode build um das UI für dieses Widget zu erstellen
  Widget build(BuildContext context) {
    // Gibt ein Scaffold-Widget zurück, das das Grundgerüst für das Material Design erstellt
    return Scaffold(
      // Der Hauptteil der App
      body: SafeArea(
        child: Stack(children: [
          // Hintergrundbild
          _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/satellite.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          Center(
            // Zentriert die Kind-Widgets
            child: Padding(
                // Fügt am Rand ein Padding hinzu
                padding: EdgeInsets.all(30.0),
                // Erstellt eine Spalte für Kind-Widgets
                child: Container()),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
