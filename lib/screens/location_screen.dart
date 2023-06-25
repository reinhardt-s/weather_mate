// Importieren der notwendigen Bibliotheken
import 'package:flutter/material.dart';
import 'package:weather_mate/services/weather.dart';
import '../utilities/constants.dart'; // Importiert Konstanten für die App

// Definiert den Standort-Bildschirm als Stateful Widget
class LocationScreen extends StatefulWidget {

  final weatherData;
  // Konstruktor für das LocationScreen Widget
  const LocationScreen({super.key, required this.weatherData});


  @override
  _LocationScreenState createState() => _LocationScreenState();
}

// Der Zustand des LocationScreen Widgets
class _LocationScreenState extends State<LocationScreen> {

  double? temp;
  String? condition;
  String? city;
  String? description;
  String weatherImage = 'assets/images/rainy_city.png';
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    temp = weatherData['main']['temp'];
    condition = weatherModel.getWeatherIcon(weatherData['weather'][0]['id']);
    city = weatherData['name'];
    description = weatherData['weather'][0]['description'];
    weatherImage = weatherModel.getWeatherImage(weatherData['weather'][0]['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Das Grundlayout des Bildschirms
      body: Container(
        // Hintergrundbild und Farbfilter für den Container
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(weatherImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        // Sicherer Bereich, um überlappende UI-Elemente zu vermeiden (z.B. Notch, Systemleiste)
        child: SafeArea(
          child: Column(
            // Widgets werden zwischen Start und Ende verteilt, und erstrecken sich in horizontaler Richtung
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Reihe von Buttons für Standortfunktionen
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FilledButton(
                    onPressed: () {}, // Aktion für den Button (zu implementieren)
                    child: Icon(
                      Icons.near_me,
                      size: 30.0,
                    ),
                  ),
                  FilledButton(
                    onPressed: () {}, // Aktion für den Button (zu implementieren)
                    child: Icon(
                      Icons.location_city,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              // Anzeige der aktuellen Temperatur und Wetterbedingungen
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temp?.round()}°', // Temperaturanzeige (statischer Wert, sollte durch tatsächliche Daten ersetzt werden)
                      style: kTempTextStyle,
                    ),
                    Text(
                      condition!, // Wettericon (statischer Wert, sollte durch tatsächliches Icon ersetzt werden)
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              // Wetternachricht basierend auf den aktuellen Bedingungen
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${description} in ${city}", // Nachricht (statischer Wert, sollte durch tatsächliche Daten ersetzt werden)
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
