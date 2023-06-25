// Importiert die Flutter Material Bibliothek
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
  Future<void> checkPermission() async {
    // Prüft, ob die App die Berechtigung hat, auf den Standort zuzugreifen
    LocationPermission permission = await Geolocator.checkPermission();

    // Wenn die App keine Berechtigung hat, wird der Benutzer um Erlaubnis gebeten
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
  }

  // void -> Kein Rückgabewert
  // async -> Asynchroner Aufruf
  // await -> Wartet auf das Ergebnis der Methode
  // Zeitaufwendige Aufgaben werden asynchron ausgeführt, um die App nicht zu blockieren
  void getLocationData() async {
    // Prüft, ob die App die Berechtigung hat, auf den Standort zuzugreifen
    await checkPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
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
            child: Container()
          ),
        ),
      ]),
    );
  }
}
