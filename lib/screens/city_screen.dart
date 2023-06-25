import 'package:flutter/material.dart';
import 'package:weather_mate/services/weather.dart';
import '../utilities/constants.dart';
import 'package:geolocator/geolocator.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  WeatherHandler weatherHandler = WeatherHandler();

  String cityName='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/city_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    fillColor: Colors.white38,
                    filled: true,
                    icon: Icon(
                      size: 40.0,
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    hintText: 'Stadtname eingeben',
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Wetter laden',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
