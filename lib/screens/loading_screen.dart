// Importiert die Flutter Material Bibliothek
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/location.dart';
import '../utilities/constants.dart';

// Definiert das StatefulWidget LoadingScreen
class LoadingScreen extends StatefulWidget {
  @override
  // Erzeugt den Status für das StatefulWidget
  _LoadingScreenState createState() => _LoadingScreenState();
}

// Definiert die Klasse _LoadingScreenState, die den Status für das StatefulWidget verwaltet
class _LoadingScreenState extends State<LoadingScreen> {
  // Future -> Ein Future-Objekt repräsentiert ein Warteobjekt für einen zukünftigen Wert


  Location location = Location();
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    await location.getCurrentLocation();
    print('Current Location: ${location.latitude} ${location.longitude}');
  }

  @override
  // Überschreibt die Methode build um das UI für dieses Widget zu erstellen
  Widget build(BuildContext context) {
    // Gibt ein Scaffold-Widget zurück, das das Grundgerüst für das Material Design erstellt
    return Scaffold(
      // Der Hauptteil der App
      body: Stack(children: [
        // Hintergrundbild
        Container(
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
    );
  }
}
