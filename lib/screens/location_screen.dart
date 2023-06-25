// Importieren der notwendigen Bibliotheken
import 'package:flutter/material.dart';
import '../utilities/constants.dart'; // Importiert Konstanten für die App

// Definiert den Standort-Bildschirm als Stateful Widget
class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

// Der Zustand des LocationScreen Widgets
class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Das Grundlayout des Bildschirms
      body: Container(
        // Hintergrundbild und Farbfilter für den Container
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/rainy_city.png'),
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
                      '16°', // Temperaturanzeige (statischer Wert, sollte durch tatsächliche Daten ersetzt werden)
                      style: kTempTextStyle,
                    ),
                    Text(
                      '🌧️', // Wettericon (statischer Wert, sollte durch tatsächliches Icon ersetzt werden)
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              // Wetternachricht basierend auf den aktuellen Bedingungen
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "Regen in Düsseldorf", // Nachricht (statischer Wert, sollte durch tatsächliche Daten ersetzt werden)
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
