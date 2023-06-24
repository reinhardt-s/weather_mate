// Importiert die Flutter Material Bibliothek
import 'package:flutter/material.dart';

// Definiert das StatefulWidget LoadingScreen
class LoadingScreen extends StatefulWidget {
  @override
  // Erzeugt den Status für das StatefulWidget
  _LoadingScreenState createState() => _LoadingScreenState();
}

// Definiert die Klasse _LoadingScreenState, die den Status für das StatefulWidget verwaltet
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  // Überschreibt die Methode build um das UI für dieses Widget zu erstellen
  Widget build(BuildContext context) {
    // Gibt ein Scaffold-Widget zurück, das das Grundgerüst für das Material Design erstellt
    return Scaffold(
      // Der Hauptteil der App
      body: Center(
        // Zentriert die Kind-Widgets
        child: Padding(
          // Fügt am Rand ein Padding hinzu
          padding: EdgeInsets.all(30.0),
          // Erstellt eine Spalte für Kind-Widgets
          child: Column(
            // Zentriert die Kind-Widgets auf der Hauptachse
            mainAxisAlignment: MainAxisAlignment.center,
            // Eine Liste von Widgets, die in dieser Spalte angezeigt werden sollen
            children: [
              // Zeigt einen Ladekreis an
              CircularProgressIndicator(),
              // Erzeugt einen leeren Platz von 30 Pixeln in der Höhe
              SizedBox(height: 30.0),
              // Zeigt einen Text unter dem Ladekreis an
              Text(
                'Lade Wetterdaten...',
                // Legt den Stil für den Text fest
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
